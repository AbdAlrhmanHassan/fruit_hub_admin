import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final String price;
  final File imageFile;
  final bool isFeatured;
  final String? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageFile,
    required this.isFeatured,
    this.imageUrl,
  });
}
