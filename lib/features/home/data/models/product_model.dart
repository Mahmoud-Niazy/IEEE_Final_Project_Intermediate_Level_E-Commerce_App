class ProductModel {
  final int id;
  final String title;
  final String description;
  final num price;
  final String category;
  final String image;

  ProductModel({
    required this.title,
    required this.image,
    required this.id,
    required this.price,
    required this.category,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      image: json['image'],
      id: json['id'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
    );
  }
}
