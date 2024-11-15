import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  Timestamp? createdAt;

  final String productId,
      productImageUrl,
      productTitle,
      productPrice,
      productQuantity,
      productDescription;

  ProductModel(
      {required this.createdAt,
      required this.productId,
      required this.productImageUrl,
      required this.productTitle,
      required this.productPrice,
      required this.productQuantity,
      required this.productDescription});

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      createdAt: data["createAt"],
      productId: data["productId"],
      productImageUrl: data["productImage"],
      productTitle: data["productTitle"],
      productPrice: data["productPrice"],
      productQuantity: data["productQuantity"],
      productDescription: data["productDescription"],
    );
  }
}
