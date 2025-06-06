import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_admin/core/services/fire_storage.dart';
import 'package:fruit_hub_admin/core/services/firestore_service.dart';
import 'package:fruit_hub_admin/core/services/supabase_storage.dart';
import 'package:fruit_hub_admin/features/add_product/admin/add_new_product_cubit/add_new_product_cubit.dart';
import 'package:fruit_hub_admin/features/add_product/domain/repos/images_repo_impl.dart';
import 'package:fruit_hub_admin/features/add_product/domain/repos/products_repo_impl.dart';

import 'widgets/add_new_products_view_body.dart';

class AddNewProductsView extends StatelessWidget {
  const AddNewProductsView({super.key});
  static const String routeName = 'AddNewProductsView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewProductCubit(
          imagesRepo: ImagesRepoImpl(FireStorage()),
          productsRepo: ProductsRepoImpl(databaseService: FireStoreService())),
      child: const Scaffold(
        // appBar: AppBar(
        //   title: const Text('اضافة منتج جديد'),
        // ),
        body: AddNewProductsViewBody(),
      ),
    );
  }
}
