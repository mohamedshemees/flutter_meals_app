
import '../entity/meal.dart';

abstract class MealsRepository{
  Future<bool> saveAllMeals(List<Meal> meals);
  Future<List<Meal>> getAllMeals();
  Future<List<Meal>> getMealsByTag(int tag);
  Future<Meal> getMealById(int id);
}