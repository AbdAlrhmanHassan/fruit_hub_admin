import 'package:flutter/material.dart';
import 'package:fruit_hub_admin/core/widgets/screen_size.dart';
 
import '../../../data/product_model.dart';

class CustomFruitCard extends StatelessWidget {
  const CustomFruitCard({
    super.key,
    required this.onPressedFavoriteButton,
    // required this.fruitImage,
    // required this.fruitName,
    // required this.fruitPrice,
    required this.onPressedAddButton,
    required this.onTapF,
    required this.productModel,
  });
  final Function()? onPressedFavoriteButton;
  // final String fruitImage;
  // final String fruitName;
  // final String fruitPrice;
  final Function()? onPressedAddButton;
  final Function()? onTapF;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, ProductsDetailsView.routeName);
      },
      splashColor: Colors.grey[300],
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: const Color(0xffF3F5F7),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.network(
                        productModel.productImageUrl,
                        fit: BoxFit.fill,
                        height: getScreenHight(context) * .25,
                        width: getScreenWidth(context) * .45,
                      ),
                    ),
                    Positioned(
                      top: -13.0,
                      right: -10.0,
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: onPressedFavoriteButton,
                          icon: const Icon(Icons.favorite_border)),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.productTitle,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff0C0D0D)),
                        ),
                        Row(
                          children: [
                            Text(
                              productModel.productPrice,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffF4A91F)),
                            ),
                            const Text(
                              '/ الكيلو',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF8C76D)),
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                        backgroundColor: const Color(0xff1B5E37),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: onPressedAddButton,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
