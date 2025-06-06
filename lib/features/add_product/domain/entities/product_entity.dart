import 'dart:io';

import 'package:fruit_hub_admin/features/add_product/domain/entities/product_review_entity.dart';

class ProductEntity {
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
  final List<ReviewEntity> reviews;
  final double discountAmount;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.discountAmount = 0,});
}
