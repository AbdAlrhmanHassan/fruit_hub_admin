import 'package:dartz/dartz.dart';
import 'package:fruit_hub_admin/core/services/data_service.dart';
import 'package:fruit_hub_admin/features/add_product/data/models/product_model.dart';
import 'package:fruit_hub_admin/features/add_product/domain/entities/product_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repo/product_repo/products_repo.dart';
import '../../../../core/utils/backend_endpoint.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addProudct(
      {required ProductEntity addProductInputEntity}) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.productsCollection,
          data: ProductModel.fromEntity(addProductInputEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Erron in adding product $e"));
    }
  }
}
