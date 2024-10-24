class Product {
  final String name;
  final double price;
  final double discountedPrice;
  final String brand;
  final double rating;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.brand,
    required this.rating,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Product{name: $name, price: $price, discountedPrice: $discountedPrice, brand: $brand, rating: $rating, imageUrl: $imageUrl}';
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    double ratingValue;
    if (json['rating'] is Map) {
      ratingValue = json['rating']['rate']?.toDouble() ?? 0.0;
    } else if (json['rating'] is num) {
      ratingValue = json['rating'].toDouble();
    } else {
      ratingValue = 0.0;
    }

    return Product(
      name: json['name'] ?? 'No Name',
      price: (json['price'] ?? 0).toDouble(),
      discountedPrice: (json['price'] ?? 0) * 0.9,
      brand: json['brand'] ?? 'Unknown Brand',
      rating: ratingValue,
      imageUrl: 'https://via.placeholder.com/150',
    );
  }
}
