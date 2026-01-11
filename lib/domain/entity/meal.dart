import '../repository/meals_repository.dart';

class Meal {
  String id;
  String name;
  int categoryId;
  String image;
  double price;
  int quantity;
  String description;
  List<String> ingredients;
  List<String> categories;
  bool isFavorite;

  Meal({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.quantity,
    required this.description,
    required this.ingredients,
    required this.categories,
    required this.isFavorite,
  });

  Meal copyWith({
    String? id,
    String? name,
    int? categoryId,
    String? image,
    double? price,
    String? description,
    List<String>? ingredients,
    List<String>? tags,
    bool? isFavorite,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
