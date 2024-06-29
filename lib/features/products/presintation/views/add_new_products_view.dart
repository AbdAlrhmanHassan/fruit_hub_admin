import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/features/products/presintation/views/widgets/add_new_products_view_body.dart';

class AddNewProductsView extends StatelessWidget {
  const AddNewProductsView({super.key});
  static const String routeName = 'AddNewProductsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة منتج جديد'),
      ),
      body: const AddNewProductsViewBody(),
    );
  }
}
