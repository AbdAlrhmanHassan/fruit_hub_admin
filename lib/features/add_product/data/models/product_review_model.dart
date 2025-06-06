import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_admin/features/add_product/domain/entities/product_review_entity.dart';

class ReviewModel {
  final String name;
  final String imageUrl;
  final num ratting;
  final String data;
  final String reviewDescription;
  final DateTime reviewTime;

  ReviewModel({
    required this.name,
    required this.imageUrl,
    required this.ratting,
    required this.data,
    required this.reviewDescription,
    required this.reviewTime,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
        name: reviewEntity.name,
        imageUrl: reviewEntity.imageUrl,
        ratting: reviewEntity.ratting,
        data: reviewEntity.data,
        reviewDescription: reviewEntity.reviewDescription,
        reviewTime: reviewEntity.reviewTime,
      );
  }

factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      ratting: json['ratting'],
      data: json['data'],
      reviewDescription: json['reviewDescription'],
      reviewTime: json['reviewTime'],
    );
}

toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'ratting': ratting,
      'data': data,
      'reviewDescription': reviewDescription,
      'reviewTime': reviewTime,
    };
  }
}
