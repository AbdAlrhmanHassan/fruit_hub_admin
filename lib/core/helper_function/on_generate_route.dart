import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/features/auth/presintation/views/widgets/login_view_body.dart';
import 'package:fruit_hub_admin/features/order/presintation/views/order_view.dart';
 
import '../../features/add_product/presintation/views/add_new_products_view.dart';
import '../../features/home/presintation/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  User? user = FirebaseAuth.instance.currentUser;
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case AddNewProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddNewProductsView());
    // case AllProductsView.routeName:
    //   return MaterialPageRoute(builder: (_) => const AllProductsView());
    case OrderView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderView());
    default:
      return user == null
          ? MaterialPageRoute(builder: (_) => const LoginViewBody())
          : MaterialPageRoute(builder: (_) => const HomeView());
  }
}
