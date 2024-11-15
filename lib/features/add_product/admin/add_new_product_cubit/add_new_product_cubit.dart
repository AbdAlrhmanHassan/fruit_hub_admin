import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

part 'add_new_product_state.dart';

class AddNewProductCubit extends Cubit<AddNewProductState> {
  AddNewProductCubit() : super(AddNewProductInitial());

  refreshThePage() {
    emit(state);
  }

  Future<String> uploadImage(
      {required File imageFile, required String productId}) async {
    try {
      emit(AddNewProductLoading());

      final Reference ref = FirebaseStorage.instance
          .ref()
          .child("product_picture")
          .child("$productId.jpg");

      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    } catch (e) {
      log("Image upload failed: $e");
      emit(AddNewProductFailure(failureMsg: e.toString()));

      return '';
    }
  }

  Future<void> addNewProduct({
    required String? productImage,
    required String productTitle,
    required String productPrice,
    required String productQuantity,
    required String productDescription,
  }) async {
    try {
      emit(AddNewProductLoading());
      final productId = const Uuid().v1();

      await FirebaseFirestore.instance
          .collection("products")
          .doc(productId)
          .set({
        'productId': productId,
        'createdAt': Timestamp.now(),
        'productImage': productImage,
        'productTitle': productTitle,
        'productPrice': productPrice,
        'productQuantity': productQuantity,
        'productDescription': productDescription,
      });

      emit(AddNewProductSuccess());
    } on FirebaseException catch (e) {
      log(e.toString());
      emit(AddNewProductFailure(failureMsg: e.toString()));
    } catch (e) {
      emit(AddNewProductFailure(failureMsg: e.toString()));
    }
  }
}
