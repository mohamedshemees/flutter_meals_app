import 'package:bloc/bloc.dart';
import 'package:food_store_flutter/domain/repository/meals_repository.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';
import 'package:food_store_flutter/presentation/screens/home/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final MealsRepository _mealsRepository;

  HomeScreenCubit(this._mealsRepository) : super(HomeScreenLoading());

  Future<void> loadHomeData() async {
    emit(HomeScreenLoading());

    try {
      final recommended = await _mealsRepository.getRecommendedMeals();
      final hottest = await _mealsRepository.getMealsByTag('Hottest');

      emit(HomeScreenSuccess(
        recommendedMeals: recommended,
        categoryMeals: hottest,
        selectedCategory: AppStrings.hottest,
      ));
    } catch (e) {
      emit(HomeScreenError('Failed to load meals'));
    }
  }

  Future<void> selectCategory(String category) async {
    if (state is HomeScreenSuccess) {
      final currentState = state as HomeScreenSuccess;
      
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
        emit(HomeScreenError('Failed to load category meals'));
      }
    }
  }

  Future<void> toggleFavorite(String mealId) async {
    if (state is HomeScreenSuccess) {
      final currentState = state as HomeScreenSuccess;

      try {
        await _mealsRepository.toggleFavorite(mealId);

        final updatedRecommended = await _mealsRepository.getRecommendedMeals();
        
        final String tag;
        switch (currentState.selectedCategory) {
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
        
        final updatedCategory = await _mealsRepository.getMealsByTag(tag);

        emit(currentState.copyWith(
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

