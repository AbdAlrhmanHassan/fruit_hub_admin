import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

import 'storage_service.dart';

class FireStorage implements StorageService {
  final storgeReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile({required File file, required String path}) async{
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    Reference fileReference =
        storgeReference.child("$path/$fileName.$extensionName");

  await fileReference.putFile(file);
String fileUrl = await fileReference.getDownloadURL();
    return fileUrl;
  }
}

// Future<String> uploadImage(
//     {required File imageFile, required String productId}) async {
//   try {
//     emit(AddNewProductLoading());

//     final Reference ref = FirebaseStorage.instance
//         .ref()
//         .child("product_picture")
//         .child("$productId.jpg");

//     await ref.putFile(imageFile);
//     return await ref.getDownloadURL();
//   } catch (e) {
//     log("Image upload failed: $e");
//     emit(AddNewProductFailure(failureMsg: e.toString()));

//     return '';
//   }
// }
