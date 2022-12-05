import 'package:flutter/material.dart';

import 'review.dart';

class Product implements Comparable<Product> {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double price;
  final double rating;
  final bool isFavourite, isPopular;
  final double? discountPercentage;
  final int stock;
  final List<Review>? reviews;



  Product({
    required this.id,
    required this.stock,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.discountPercentage,
    required this.price,
    required this.description,
    this.reviews,
  });


  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    stock: json["stock"],
    description: json["description"],
    rating: json["rating"].toDouble(),
    isFavourite: json["isFavourite"],
    isPopular: json["isPopular"],
    colors: List<Color>.from(json["colors"].map((x) => x)),
    images: List<String>.from(json["images"].map((x) => x)),
      discountPercentage: json["discountPercentage"].toDouble(),
  );

  @override
  int compareTo(Product other) => title.compareTo(other.title);
}



// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …",
    rating: 4.8,
    isFavourite: true,
    isPopular: true, discountPercentage: 0.3, stock: 5,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: 'Powered by sweat-wicking technology, the Nike Sport Clash Pants are made with stretch-woven fabric that keeps you dry and moving freely from the gym to off-the-beaten-track workouts. High-powered graphics are inspired by the spirit of motocross. Features: Stretchy, lightweight fabric with Dri-FIT technology helps keep you dry, comfortable and moving naturally.',
    rating: 4.1,
    isPopular: true, discountPercentage: 0.2, stock: 10,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: 'joaijsdoiajsodjo iajoasjoaij doasjid oaji odaisj doasij d',
    rating: 4.1,
    isFavourite: true,
    isPopular: true, discountPercentage: 0, stock: 9,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: 'oikfd oikdof ikoikodfibjodjfiodfijo ijdif jdif idufjojodfij ',
    rating: 4.1,
    isFavourite: true, discountPercentage: 0, stock: 0,
  ),
];

