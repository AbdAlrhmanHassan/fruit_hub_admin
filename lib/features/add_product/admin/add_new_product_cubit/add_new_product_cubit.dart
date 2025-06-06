import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_admin/core/errors/failures.dart';
import 'package:fruit_hub_admin/core/repo/images_repo/images_repo.dart';
import 'package:fruit_hub_admin/core/repo/product_repo/products_repo.dart';
import 'package:fruit_hub_admin/features/add_product/domain/entities/product_entity.dart';
import 'package:uuid/uuid.dart';

part 'add_new_product_state.dart';

class AddNewProductCubit extends Cubit<AddNewProductState> {
  AddNewProductCubit({required this.imagesRepo, required this.productsRepo})
      : super(AddNewProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addNewProduct({
    required ProductEntity addProductInputEntity,
  }) async {
    emit(AddNewProductLoading());
    Either<Failure, String> result =
        await imagesRepo.uploadImage(file: addProductInputEntity.imageFile);
    result.fold((l) {
      log("Error in adding image product ${l.message}");

      emit(AddNewProductFailure(failureMsg: l.message));
    }, (r) async {
      addProductInputEntity.imageUrl = r;
      var result = await productsRepo.addProudct(
          addProductInputEntity: addProductInputEntity);
      result.fold((l) {
        log("Error in adding product  ${l.message}");
        emit(AddNewProductFailure(failureMsg: l.message));
      }, (r) {
        emit(AddNewProductSuccess());
      });
    });
  }
}

// refreshThePage() {
//     emit(state);
//   }

//   Future<String> uploadImage(
//       {required File imageFile, required String productId}) async {
//     try {
//       emit(AddNewProductLoading());

//       final Reference ref = FirebaseStorage.instance
//           .ref()
//           .child("product_picture")
//           .child("$productId.jpg");

//       await ref.putFile(imageFile);
//       return await ref.getDownloadURL();
//     } catch (e) {
//       log("Image upload failed: $e");
//       emit(AddNewProductFailure(failureMsg: e.toString()));

//       return '';
//     }
//   }

//   Future<void> addNewProduct({
//     required String? productImage,
//     required String productTitle,
//     required String productPrice,
//     required String productQuantity,
//     required String productDescription,
//   }) async {
//     try {
//       emit(AddNewProductLoading());
//       final productId = const Uuid().v1();

//       await FirebaseFirestore.instance
//           .collection("products")
//           .doc(productId)
//           .set({
//         'productId': productId,
//         'createdAt': Timestamp.now(),
//         'productImage': productImage,
//         'productTitle': productTitle,
//         'productPrice': productPrice,
//         'productQuantity': productQuantity,
//         'productDescription': productDescription,
//       });

//       emit(AddNewProductSuccess());
//     } on FirebaseException catch (e) {
//       log(e.toString());
//       emit(AddNewProductFailure(failureMsg: e.toString()));
//     } catch (e) {
//       emit(AddNewProductFailure(failureMsg: e.toString()));
//     }
//   }