import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fruit_hub_admin/core/errors/failures.dart';
import 'package:fruit_hub_admin/core/utils/backend_endpoint.dart';

import '../../../../core/repo/images_repo/images_repo.dart';
import '../../../../core/services/storage_service.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage({required File file}) async {
    try {
      String url = await storageService.uploadFile(
          file: file, path: BackendEndpoint.images);
return Right(url);
    } on Exception catch (e) {
 return Left(ServerFailure( "Failed to upload image: $e"));
    }
  }
}
