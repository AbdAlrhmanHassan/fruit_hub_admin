abstract class DatabaseService {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data, String? uId});
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId});

      Future<bool> checkIfDocExists({required String path, required String docId});
}
