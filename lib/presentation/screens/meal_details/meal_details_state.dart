abstract class MealDetailsState {}

class MealDetailsSuccess extends MealDetailsState {
  final int quantity;

  MealDetailsSuccess({
    required this.quantity,
  });

  MealDetailsSuccess copyWith({
    int? quantity,
  }) {
    return MealDetailsSuccess(
      quantity: quantity ?? this.quantity,
    );
  }
}
