// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruit_hub_admin/features/auth/presintation/views/widgets/search_text_field.dart';
// import 'package:fruit_hub_admin/features/products/presintation/views/widgets/custom_product_card.dart';

// import '../../../../../core/style/app_colors.dart';
// import '../../../../../core/widgets/screen_size.dart';
// import '../../../../products/admin/fetch_products_cubit/view_all_products_cubit.dart';
// import '../../../../products/data/product_model.dart';

// class ViewAllProductsBody extends StatefulWidget {
//   const ViewAllProductsBody({
//     Key? key,
//     required this.searchTextController,
//   }) : super(key: key);

//   final TextEditingController searchTextController;

//   @override
//   State<ViewAllProductsBody> createState() => _ViewAllProductsBodyState();
// }

// class _ViewAllProductsBodyState extends State<ViewAllProductsBody> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ViewAllProductsCubit>(context).fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ViewAllProductsCubit, ViewAllProductsState>(
//       listener: (context, state) {
//         if (state is ViewAllProductsSuccess) {
//           log("Products fetched: ${state.productModel.length}");
//         } else if (state is ViewAllProductsFailure) {
//           log("Error: ${state.errorMsg}");
//         }
//       },
//       builder: (context, state) {
//         if (state is ViewAllProductsLoading) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: StyleColors.primaryColor,
//             ),
//           );
//         } else if (state is ViewAllProductsSuccess) {
//           List<ProductModel> productsModelL = state.productModel;
//           return RefreshIndicator(
//             displacement: 33,
//             color: StyleColors.primaryColor,
//             onRefresh: () async {
//               await BlocProvider.of<ViewAllProductsCubit>(context)
//                   .fetchProducts();
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0),
//               child: Column(
//                 children: [
//                   SearchTextField(
//                     onChangedF: (value) async {
//                       // log("Search query: $value");
//                       // await BlocProvider.of<ViewAllProductsCubit>(context)
//                       //     .searchProducts(value);
//                       // log(state.productModel.toString());
//                       // productsModelL = state.productModel;
//                     },
//                     textEditingController: widget.searchTextController,
//                   ),
//                   const SizedBox(height: 16),
//                   Expanded(
//                     child: GridView.count(
//                       physics: const ScrollPhysics(),
//                       shrinkWrap: true,
//                       childAspectRatio: getScreenWidth(context) < 500
//                           ? getScreenWidth(context) /
//                               (getScreenHight(context) / 1.2)
//                           : getScreenWidth(context) / getScreenHight(context),
//                       crossAxisCount: getScreenWidth(context) < 500 ? 2 : 3,
//                       children: List.generate(
//                         productsModelL.length,
//                         (index) => CustomFruitCard(
//                           productModel: productsModelL[index],
//                           onPressedFavoriteButton: () {},
//                           onPressedAddButton: () {},
//                           onTapF: () {},
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else if (state is ViewAllProductsFailure) {
//           return Center(
//             child: Text(state.errorMsg),
//           );
//         } else {
//           return const Center(
//             child:   Text("No products found"),
//           );
//         }
//       },
//     );
//   }
// }
