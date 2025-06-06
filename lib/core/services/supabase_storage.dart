import 'dart:io';

import 'package:fruit_hub_admin/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static Future<void> createBucket({required String bucketName}) async {
    List<Bucket> buckets = await _supabase.client.storage.listBuckets();
    bool isExists = false;
    for (Bucket bucket in buckets) {
      if (bucket.name == bucketName) {
        isExists = true;
        break;
      }
    }
    if (isExists == false) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initializeSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://njmsdaqckphrsehmuxif.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5qbXNkYXFja3BocnNlaG11eGlmIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNDAzNjU3NywiZXhwIjoyMDQ5NjEyNTc3fQ.kcicpiYK7p79exZWl82kptqVwZKu_ceh9qwU_cD3DCY',
    );
  }

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    var result = await _supabase.client.storage
        .from("fruits_images")
        .upload('$path/$fileName.$extensionName', file);

    final String publicUrl = _supabase.client.storage
        .from('fuits_images')
        .getPublicUrl('$path/$fileName.$extensionName');

    return publicUrl;
  }
}
//  Future<String> uploadFile({required File file, required String path}) async{
//     String fileName = b.basename(file.path);
//     String extensionName = b.extension(file.path);
//     Reference fileReference =
//         storgeReference.child("$path/$fileName.$extensionName");

//   await fileReference.putFile(file);
// String fileUrl = await fileReference.getDownloadURL();
//     return fileUrl;
  // }