import 'package:fruit_hub_admin/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addProudct({required AddProductInputEntity addProductInputEntity});
}
