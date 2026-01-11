import 'package:food_store_flutter/domain/entity/meal.dart';

abstract class AppMealsState {}

class AppMealsLoading extends AppMealsState {}

class AppMealsError extends AppMealsState {
  final String message;

  AppMealsError(this.message);
}

class AppMealsSuccess extends AppMealsState {
  final List<Meal> allMeals;
  final List<Meal> recommendedMeals;
  final List<Meal> categoryMeals;
  final String selectedCategory;

  AppMealsSuccess({
    required this.allMeals,
    required this.recommendedMeals,
    required this.categoryMeals,
    required this.selectedCategory,
  });

  AppMealsSuccess copyWith({
    List<Meal>? allMeals,
    List<Meal>? recommendedMeals,
    List<Meal>? categoryMeals,
    String? selectedCategory,
  }) {
    return AppMealsSuccess(
      allMeals: allMeals ?? this.allMeals,
      recommendedMeals: recommendedMeals ?? this.recommendedMeals,
      categoryMeals: categoryMeals ?? this.categoryMeals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  Meal? getMealById(String mealId) {
    try {
      return allMeals.firstWhere((meal) => meal.id == mealId);
    } catch (e) {
      return null;
    }
  }
}
