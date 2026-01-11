import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:food_store_flutter/data/dummy_meals.dart';

import '../../../domain/entity/meal.dart';
import '../../../domain/repository/cart_repository.dart';

part 'cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final CartRepository _cartRepository;

  CartScreenCubit(this._cartRepository)
    : super(
        CartScreenState(
          isLoading: true,
          error: null,
          success: false,
          meals: [],
          totalPrice: 0.0,
        ),
      );

  void getCartItems() {
    final cartProducts = dummyMeals;
    var totalPrice = 0.0;
    for (var product in cartProducts) {
      totalPrice += product.price * 3;
    }
    try {
      emit(
        state.copyWith(
          meals: cartProducts,
          totalPrice: totalPrice,
          isLoading: false,
        ),
      );
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}
