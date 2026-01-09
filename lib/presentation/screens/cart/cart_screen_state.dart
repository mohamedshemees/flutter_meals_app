part of 'cart_screen_cubit.dart';

@immutable
class CartScreenState {
  final bool isLoading;
  final String? error;
  final bool success;
  final List<Meal> meals;
  final double totalPrice;

  const CartScreenState({
    required this.isLoading,
    required this.error,
    required this.success,
    required this.meals,
    required this.totalPrice,
  });

  CartScreenState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
    List<Meal>? meals,
    double? totalPrice,
  }) {
    return CartScreenState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      success: success ?? this.success,
      meals: meals ?? this.meals,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
