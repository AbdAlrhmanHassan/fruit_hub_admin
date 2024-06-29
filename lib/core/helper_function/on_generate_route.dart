import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/features/order/presintation/views/order_view.dart';
import 'package:fruit_hub_admin/features/products/presintation/views/add_new_products_view.dart';
import 'package:fruit_hub_admin/features/products/presintation/views/all_produts_view.dart';

import '../../features/home/presintation/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AddNewProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddNewProductsView());

    case AllProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AllProductsView());
    case OrderView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderView());
    default:
      return MaterialPageRoute(builder: (_) => const HomeView());
  }
}
