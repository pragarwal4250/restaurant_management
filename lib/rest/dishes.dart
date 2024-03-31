const String dishUrl = 'http://localhost:3000';

class Dish{
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String image;

  Dish({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,

  });

  factory Dish.fromJson(Map<String, dynamic> json){
    return Dish(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}