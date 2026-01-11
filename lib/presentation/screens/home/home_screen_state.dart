import 'package:food_store_flutter/domain/entity/meal.dart';

abstract class HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError(this.message);
}

class HomeScreenSuccess extends HomeScreenState {
  final List<Meal> recommendedMeals;
  final List<Meal> categoryMeals;
  final String selectedCategory;

  HomeScreenSuccess({
    required this.recommendedMeals,
    required this.categoryMeals,
    required this.selectedCategory,
  });

  HomeScreenSuccess copyWith({
    List<Meal>? recommendedMeals,
    List<Meal>? categoryMeals,
    String? selectedCategory,
  }) {
    return HomeScreenSuccess(
      recommendedMeals: recommendedMeals ?? this.recommendedMeals,
      categoryMeals: categoryMeals ?? this.categoryMeals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
