
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../data/product_model.dart';

part 'view_all_products_state.dart';

class ViewAllProductsCubit extends Cubit<ViewAllProductsState> {
  ViewAllProductsCubit() : super(ViewAllProductsInitial());

  final produtDB = FirebaseFirestore.instance.collection("products");

  Future<void> fetchProducts() async {
    try {
      emit(ViewAllProductsLoading());
      final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
          await produtDB.orderBy("createdAt", descending: true).get();
      final List<ProductModel> productsList = productsSnapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc))
          .toList();
      emit(ViewAllProductsSuccess(productModel: productsList));
    } catch (e) {
      emit(ViewAllProductsFailure(errorMsg: e.toString()));
      rethrow;
    }
  }

  Future<void> searchProducts(String query) async {
    try {
      // emit(ViewAllProductsLoading());
      final QuerySnapshot<Map<String, dynamic>> productsSnapshot =
          await produtDB
              .where("productTitle", isGreaterThanOrEqualTo: query)
              .where("productTitle", isLessThanOrEqualTo: '$query\uf8ff')
              .get();
      final List<ProductModel> productsList = productsSnapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc))
          .toList();
      emit(ViewAllProductsSuccess(productModel: productsList));
    } catch (e) {
      emit(ViewAllProductsFailure(errorMsg: e.toString()));
      rethrow;
    }
  }
}
