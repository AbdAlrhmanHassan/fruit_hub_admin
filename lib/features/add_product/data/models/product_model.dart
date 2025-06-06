import 'dart:io';

import 'package:fruit_hub_admin/features/add_product/data/models/product_review_model.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final String price;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  num avgRating = 0;
  num ratingCount = 0;
  final double sellingCount;
  final List<ReviewModel> reviews;
  final double discountAmount;
  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.reviews,
    this.sellingCount = 0,
    this.discountAmount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      imageFile: addProductInputEntity.imageFile,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expirationMonths: addProductInputEntity.expirationMonths,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      isOrganic: addProductInputEntity.isOrganic,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      discountAmount: addProductInputEntity.discountAmount,
    );
  }

  toJson() => {
        "name": name,
        "code": code,
        "description": description,
        "price": price,
        "isFeatured": isFeatured,
        "imageUrl": imageUrl,
        "expirationMonths": expirationMonths,
        "numberOfCalories": numberOfCalories,
        "unitAmount": unitAmount,
        "isOrganic": isOrganic,
        "reviews": reviews.map((e) => e.toJson()).toList(),
        "sellingCount": sellingCount,
        "discountAmount": discountAmount,
      };
}
