import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/features/products/presintation/views/widgets/all_produts_view_body.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});
  static const String routeName = 'AllProductsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع المنتجات'),
      ),
      body: const AllProductsViewBody(),
    );
  }
}
