
abstract class CartRepository {
  Future<bool> addMealToCart(int mealId, int quantity);
  Future<bool> increaseMealQuantity(int mealId);
  Future<bool> decreaseMealQuantity(int mealId);
}