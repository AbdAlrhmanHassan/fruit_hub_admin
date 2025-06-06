import 'data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? uId}) async {
    if (uId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(uId).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    DocumentSnapshot<Map<String, dynamic>> data =
        await firestore.collection(path).doc(docId).get();

    return data.data()!;
  }

  @override
  Future<bool> checkIfDocExists(
      {required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
