import 'package:food_store_flutter/domain/entity/meal.dart';

class MealModel {
  final String id;
  final String name;
  final int categoryId;
  final String image;
  final double price;
  final String description;
  final List<String> ingredients;
  final List<String> tags;
  final bool isFavorite;

  MealModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.tags,
    required this.isFavorite,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as int,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      tags: List<String>.from(json['tags'] as List),
      isFavorite: json['isFavorite'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'image': image,
      'price': price,
      'description': description,
      'ingredients': ingredients,
      'tags': tags,
      'isFavorite': isFavorite,
    };
  }

  Meal toEntity() {
    return Meal(
      id: id,
      name: name,
      categoryId: categoryId,
      image: image,
      price: price,
      description: description,
      ingredients: List.from(ingredients),
      tags: List.from(tags),
      isFavorite: isFavorite,
    );
  }

  factory MealModel.fromEntity(Meal meal) {
    return MealModel(
      id: meal.id,
      name: meal.name,
      categoryId: meal.categoryId,
      image: meal.image,
      price: meal.price,
      description: meal.description,
      ingredients: List.from(meal.ingredients),
      tags: List.from(meal.tags),
      isFavorite: meal.isFavorite,
    );
  }

  MealModel copyWith({
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
    return MealModel(
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
