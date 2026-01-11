import 'package:food_store_flutter/data/datasources/meals_local_datasource.dart';
import 'package:food_store_flutter/domain/entity/meal.dart';
import 'package:food_store_flutter/domain/repository/meals_repository.dart';

class MealsRepositoryImpl implements MealsRepository {
  final MealsLocalDataSource _localDataSource;

  MealsRepositoryImpl(this._localDataSource);

  @override
  Future<List<Meal>> getAllMeals() async {
    try {
      final mealModels = await _localDataSource.getAllMeals();
      return mealModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Future<List<Meal>> getRecommendedMeals() async {
    try {
      final mealModels = await _localDataSource.getRecommendedMeals();
      return mealModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load recommended meals');
    }
  }

  @override
  Future<List<Meal>> getMealsByTag(String tag) async {
    try {
      final mealModels = await _localDataSource.getMealsByTag(tag);
      return mealModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load meals by tag');
    }
  }

  @override
  Future<void> toggleFavorite(String mealId) async {
    try {
      await _localDataSource.toggleFavorite(mealId);
    } catch (e) {
      throw Exception('Failed to toggle favorite');
    }
  }

  @override
  Future<Meal> getMealById(int id) async {
    try {
      final mealModel = await _localDataSource.getMealById(id.toString());
      if (mealModel == null) {
        throw Exception('Meal not found');
      }
      return mealModel.toEntity();
    } catch (e) {
      throw Exception('Failed to load meal');
    }
  }

  @override
  Future<List<Meal>> getMealsByCategory(MealCategory category) async {
    try {
      final mealModels = await _localDataSource.getAllMeals();
      return mealModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to load meals by category');
    }
  }

  @override
  Future<bool> saveAllMeals(List<Meal> meals) async {
    try {
      return true;
    } catch (e) {
      throw Exception('Failed to save meals');
    }
  }
}
