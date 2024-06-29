import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/features/order/presintation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String routeName = 'OrderView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطلبات'),
      ),
      body: const OrderViewBody(),
    );
  }
}
