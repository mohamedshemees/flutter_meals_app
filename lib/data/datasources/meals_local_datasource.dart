import 'package:food_store_flutter/data/models/meal_model.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_assets.dart';

class MealsLocalDataSource {
  final List<MealModel> _meals = [
    MealModel(
      id: '1',
      name: 'Honey lime combo',
      categoryId: 1,
      image: AppAssets.imgHoneyLimePeach,
      price: 2000,
      description: 'A refreshing combo of honey and lime.',
      ingredients: ['Honey', 'Lime', 'Pineapple', 'Apple'],
      tags: ['Hottest', 'Popular'],
      isFavorite: false,
    ),
    MealModel(
      id: '2',
      name: 'Berry mango combo',
      categoryId: 1,
      image:  AppAssets.imgBreakfastQuinoa,
      price: 8000,
      description: 'Sweet berry and mango combination.',
      ingredients: ['Berry', 'Mango', 'Strawberry'],
      tags: ['Hottest'],
      isFavorite: true,
    ),
    MealModel(
      id: '3',
      name: 'Quinoa fruit salad',
      categoryId: 2,
      image:  AppAssets.imgTropicalFruitSalad,
      price: 10000,
      description: 'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
      ingredients: ['Red Quinoa', 'Lime', 'Honey', 'Blueberries', 'Strawberries', 'Mango'],
      tags: ['Hottest', 'Popular', 'Top'],
      isFavorite: false,
    ),
    MealModel(
      id: '4',
      name: 'Tropical fruit salad',
      categoryId: 2,
      image:  AppAssets.imgBreakfastQuinoa,
      price: 10000,
      description: 'Tropical fruits in a bowl.',
      ingredients: ['Pineapple', 'Mango', 'Papaya', 'Coconut'],
      tags: ['Popular', 'New combo'],
      isFavorite: true,
    ),
    MealModel(
      id: '5',
      name: 'melon fruit salad',
      categoryId: 3,
      image: AppAssets.imgHoneyLimePeach,
      price: 10000,
      description: 'Fresh melon salad.',
      ingredients: ['Watermelon', 'Cantaloupe', 'Honeydew', 'Mint'],
      tags: ['New combo', 'Top'],
      isFavorite: false,
    ),
    MealModel(
      id: '6',
      name: 'Citrus Burst',
      categoryId: 1,
      image: AppAssets.imgTropicalFruitSalad,
      price: 7500,
      description: 'Zesty citrus fruits.',
      ingredients: ['Orange', 'Grapefruit', 'Lemon', 'Lime'],
      tags: ['Top'],
      isFavorite: false,
    ),
  ];

  Future<List<MealModel>> getAllMeals() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_meals);
  }

  Future<List<MealModel>> getMealsByTag(String tag) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _meals.where((meal) => meal.tags.contains(tag)).toList();
  }

  Future<List<MealModel>> getRecommendedMeals() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _meals.take(4).toList();
  }

  Future<void> toggleFavorite(String mealId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final index = _meals.indexWhere((meal) => meal.id == mealId);
    if (index != -1) {
      _meals[index] = _meals[index].copyWith(
        isFavorite: !_meals[index].isFavorite,
      );
    }
  }

  Future<MealModel?> getMealById(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      return _meals.firstWhere((meal) => meal.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveAllMeals(List<MealModel> meals) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _meals.clear();
    _meals.addAll(meals);
    return true;
  }
}
