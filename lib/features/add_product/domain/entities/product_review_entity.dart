class ReviewEntity {
  final String name;
  final String imageUrl;
  final num ratting;
  final String data;
  final String reviewDescription;
  final DateTime reviewTime;

  ReviewEntity({
    required this.name,
    required this.imageUrl,
    required this.ratting,
    required this.data,
    required this.reviewDescription,
    required this.reviewTime,
  });
}
