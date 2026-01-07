
import '../entity/meal.dart';

abstract class MealsRepository{
  Future<bool> saveAllMeals(List<Meal> meals);
  Future<List<Meal>> getAllMeals();
  Future<List<Meal>> getMealsByCategory(MealCategory category);
  Future<Meal> getMealById(int id);
}
enum MealCategory { hottest, popular, newCombo, top }
