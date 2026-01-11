import 'package:bloc/bloc.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit() : super(MealDetailsSuccess(quantity: 1));

  void increaseQuantity() {
    if (state is MealDetailsSuccess) {
      final currentState = state as MealDetailsSuccess;
      emit(currentState.copyWith(quantity: currentState.quantity + 1));
    }
  }

  void decreaseQuantity() {
    if (state is MealDetailsSuccess) {
      final currentState = state as MealDetailsSuccess;
      if (currentState.quantity > 1) {
        emit(currentState.copyWith(quantity: currentState.quantity - 1));
      }
    }
  }

  void addToBasket() {
    // TODO: Implement add to basket logic
  }
}
