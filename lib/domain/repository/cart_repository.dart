abstract class CartRepository {
  void addMealToCart(int mealId, int quantity);
  void removeMealFromCart(int mealId);
  void clearCart();
  void updateQuantity(int mealId, int quantity);
}

enum MealCategory { hottest, popular, newCombo, top }
