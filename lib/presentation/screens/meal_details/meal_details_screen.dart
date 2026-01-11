import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store_flutter/presentation/cubits/app_meals_cubit.dart';
import 'package:food_store_flutter/presentation/cubits/app_meals_state.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/meal_details_cubit.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/meal_details_state.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/widgets/bottom_action_bar.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/widgets/description_section.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/widgets/ingredients_section.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/widgets/meal_image_header.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/widgets/meal_title_price_row.dart';
import 'package:food_store_flutter/presentation/screens/meal_details/widgets/quantity_selector.dart';

class MealDetailsScreen extends StatelessWidget {
  final String mealId;

  const MealDetailsScreen({
    super.key,
    required this.mealId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealDetailsCubit(),
      child: MealDetailsContent(mealId: mealId),
    );
  }
}

class MealDetailsContent extends StatelessWidget {
  final String mealId;

  const MealDetailsContent({
    super.key,
    required this.mealId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<AppMealsCubit, AppMealsState>(
        builder: (context, mealsState) {
          if (mealsState is! AppMealsSuccess) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }

          final meal = mealsState.getMealById(mealId);

          if (meal == null) {
            return Center(
              child: Text(
                'Meal not found',
                style: const TextStyle(
                  fontFamily: AppFonts.brandonGrotesque,
                  fontSize: 16,
                  color: AppColors.error,
                ),
              ),
            );
          }

          return BlocBuilder<MealDetailsCubit, MealDetailsState>(
            builder: (context, quantityState) {
              if (quantityState is! MealDetailsSuccess) {
                return const SizedBox.shrink();
              }

              return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MealImageHeader(
                        imageUrl: meal.image,
                        onBackTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -32, 0),
                        decoration: const BoxDecoration(
                          color: AppColors.pureWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MealTitlePriceRow(
                                title: meal.name,
                              ),
                              const SizedBox(height: 24),
                              QuantitySelector(
                                quantity: quantityState.quantity,
                                price: meal.price,
                                onIncrease: () {
                                  HapticFeedback.lightImpact();
                                  context.read<MealDetailsCubit>().increaseQuantity();
                                },
                                onDecrease: () {
                                  HapticFeedback.lightImpact();
                                  context.read<MealDetailsCubit>().decreaseQuantity();
                                },
                              ),
                              const SizedBox(height: 32),
                              IngredientsSection(
                                ingredients: meal.ingredients,
                              ),
                              const SizedBox(height: 32),
                              DescriptionSection(
                                description: meal.description,
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BottomActionBar(
                    isFavorite: meal.isFavorite,
                    onFavoriteTap: () {
                      HapticFeedback.lightImpact();
                      context.read<AppMealsCubit>().toggleFavorite(mealId);
                    },
                    onAddToBasket: () {
                      HapticFeedback.mediumImpact();
                      context.read<MealDetailsCubit>().addToBasket();
                    },
                  ),
                ),
              ],
              );
            },
          );
        },
      ),
    );
  }
}
