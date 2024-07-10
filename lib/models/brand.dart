class Brand {
  String id;
  String brandName;
  String brandImage;

  Brand({
    required this.id,
    required this.brandName,
    required this.brandImage,
  });

  factory Brand.fromMap(Map<String, dynamic> data, String id) {
    return Brand(
      id: id,
      brandName: data['brandName'],
      brandImage: data['brandImage'],
    );
  }
}
