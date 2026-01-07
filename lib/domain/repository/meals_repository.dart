
import '../entity/meal.dart';

abstract class MealsRepository{
  Future<bool> saveAllMeals(List<Meal> meals);
  Future<List<Meal>> getAllMeals();
  Future<List<Meal>> getMealsByTag(int tag);
  Future<Meal> getMealById(int id);
  Future<bool> addMealToCart(int mealId, int quantity);
  Future<bool> increaseMealQuantity(int mealId);
  Future<bool> decreaseMealQuantity(int mealId);
}