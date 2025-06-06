import 'package:dartz/dartz.dart';
import 'package:fruit_hub_admin/features/add_product/domain/entities/product_entity.dart';

import '../../errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProudct(
      {required ProductEntity addProductInputEntity});
}
