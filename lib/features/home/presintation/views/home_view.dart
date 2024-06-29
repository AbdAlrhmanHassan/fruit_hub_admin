import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/features/order/presintation/views/order_view.dart';

import '../../../products/presintation/views/add_new_products_view.dart';
import '../../../products/presintation/views/all_produts_view.dart';
import 'widgets/dashboard_btn.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fruit Hub Admin',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              DashboardButtonsWidget(
                context,
                title: 'إضافة منتج جديد',
                imagePath: 'assets/images/dashboard/cloud.png',
                onPressed: () {
                  Navigator.pushNamed(context, AddNewProductsView.routeName);
                },
              ),
              DashboardButtonsWidget(
                context,
                title: "عرض جميع المنتجات",
                imagePath: 'assets/images/app_logo.png',
                onPressed: () {
                  Navigator.pushNamed(context, AllProductsView.routeName);
                },
              ),
              DashboardButtonsWidget(
                context,
                title: "الطلبات",
                imagePath: 'assets/images/dashboard/order.png',
                onPressed: () {
                  Navigator.pushNamed(context, OrderView.routeName);
                },
              ),
            ]),
      ),
    );
  }
}
