import 'package:bloc/bloc.dart';
import 'package:food_store_flutter/domain/repository/meals_repository.dart';
import 'package:food_store_flutter/presentation/cubits/app_meals_state.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';

class AppMealsCubit extends Cubit<AppMealsState> {
  final MealsRepository _mealsRepository;

  AppMealsCubit(this._mealsRepository) : super(AppMealsLoading());

  Future<void> loadMeals() async {
    emit(AppMealsLoading());

    try {
      final allMeals = await _mealsRepository.getAllMeals();
      final recommended = await _mealsRepository.getRecommendedMeals();
      final hottest = await _mealsRepository.getMealsByTag('Hottest');

      emit(AppMealsSuccess(
        allMeals: allMeals,
        recommendedMeals: recommended,
        categoryMeals: hottest,
        selectedCategory: AppStrings.hottest,
      ));
    } catch (e) {
      emit(AppMealsError('Failed to load meals'));
    }
  }

  Future<void> selectCategory(String category) async {
    if (state is AppMealsSuccess) {
      final currentState = state as AppMealsSuccess;

      try {
        final String tag;
        switch (category) {
          case AppStrings.hottest:
            tag = 'Hottest';
            break;
          case AppStrings.popular:
            tag = 'Popular';
            break;
          case AppStrings.newCombo:
            tag = 'New combo';
            break;
          case AppStrings.top:
            tag = 'Top';
            break;
          default:
            tag = 'Hottest';
        }

        final filteredMeals = await _mealsRepository.getMealsByTag(tag);

        emit(currentState.copyWith(
          categoryMeals: filteredMeals,
          selectedCategory: category,
        ));
      } catch (e) {
        emit(AppMealsError('Failed to load category meals'));
      }
    }
  }

  Future<void> toggleFavorite(String mealId) async {
    if (state is AppMealsSuccess) {
      final currentState = state as AppMealsSuccess;

      try {
        await _mealsRepository.toggleFavorite(mealId);

        final updatedAllMeals = currentState.allMeals.map((meal) {
          if (meal.id == mealId) {
            return meal.copyWith(isFavorite: !meal.isFavorite);
          }
          return meal;
        }).toList();

        final updatedRecommended = currentState.recommendedMeals.map((meal) {
          if (meal.id == mealId) {
            return meal.copyWith(isFavorite: !meal.isFavorite);
          }
          return meal;
        }).toList();

        final updatedCategory = currentState.categoryMeals.map((meal) {
          if (meal.id == mealId) {
            return meal.copyWith(isFavorite: !meal.isFavorite);
          }
          return meal;
        }).toList();

        emit(currentState.copyWith(
          allMeals: updatedAllMeals,
          recommendedMeals: updatedRecommended,
          categoryMeals: updatedCategory,
        ));
      } catch (e) {
        // Silent fail for favorite toggle
      }
    }
  }

  void addToCart(String mealId) {
    // TODO: Implement cart logic
  }
}
