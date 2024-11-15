import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';

abstract class ImagesRepo{
  Future<Either<Failure, String >> uploadImage({required File file});
}