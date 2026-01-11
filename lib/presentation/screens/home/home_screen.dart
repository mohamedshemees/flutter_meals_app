import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store_flutter/di/dependency_provider.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';
import 'package:food_store_flutter/presentation/screens/home/home_screen_cubit.dart';
import 'package:food_store_flutter/presentation/screens/home/home_screen_state.dart';
import 'package:food_store_flutter/presentation/screens/home/widgets/category_product_card.dart';
import 'package:food_store_flutter/presentation/screens/home/widgets/category_tab_item.dart';
import 'package:food_store_flutter/presentation/screens/home/widgets/greeting_section.dart';
import 'package:food_store_flutter/presentation/screens/home/widgets/home_header.dart';
import 'package:food_store_flutter/presentation/screens/home/widgets/recommended_combo_card.dart';
import 'package:food_store_flutter/presentation/screens/home/widgets/search_filter_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenCubit>()..loadHomeData(),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            if (state is HomeScreenError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    fontFamily: AppFonts.brandonGrotesque,
                    fontSize: 16,
                    color: AppColors.error,
                  ),
                ),
              );
            }

            if (state is HomeScreenSuccess) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(
                      onBasketTap: () {
                        // TODO: Navigate to basket
                      },
                      onMenuTap: () {
                        // TODO: Open drawer/menu
                      },
                    ),
                    const GreetingSection(userName: 'Tony'),
                    const SizedBox(height: 24),
                    SearchFilterRow(
                      onFilterTap: () {
                        // TODO: Open filter
                      },
                    ),
                    const SizedBox(height: 32),
                    RecommendedComboSection(
                      meals: state.recommendedMeals,
                    ),
                    const SizedBox(height: 32),
                    CategoryTabsSection(
                      selectedCategory: state.selectedCategory,
                    ),
                    const SizedBox(height: 24),
                    CategoryProductsSection(
                      meals: state.categoryMeals,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class RecommendedComboSection extends StatelessWidget {
  final List meals;

  const RecommendedComboSection({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            AppStrings.recommendedCombo,
            style: TextStyle(
              fontFamily: AppFonts.brandonGrotesque,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 183,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 24),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return RecommendedComboCard(
                meal: meal,
                onTap: () {
                  // TODO: Navigate to detail
                },
                onAddTap: () {
                  HapticFeedback.lightImpact();
                  context.read<HomeScreenCubit>().addToCart(meal.id);
                },
                onFavoriteTap: () {
                  context.read<HomeScreenCubit>().toggleFavorite(meal.id);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryTabsSection extends StatelessWidget {
  final String selectedCategory;

  const CategoryTabsSection({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      AppStrings.hottest,
      AppStrings.popular,
      AppStrings.newCombo,
      AppStrings.top,
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryTabItem(
            title: category,
            isSelected: category == selectedCategory,
            onTap: () {
              context.read<HomeScreenCubit>().selectCategory(category);
            },
          );
        },
      ),
    );
  }
}

class CategoryProductsSection extends StatelessWidget {
  final List meals;

  const CategoryProductsSection({
    super.key,
    required this.meals,
  });

  List<Color> get _pastelColors => [
        AppColors.pastelPink,
        AppColors.pastelYellow,
        AppColors.pastelGreen,
        AppColors.pastelBlue,
        AppColors.pastelPurple,
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 183,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          final backgroundColor = _pastelColors[index % _pastelColors.length];
          
          return CategoryProductCard(
            meal: meal,
            backgroundColor: backgroundColor,
            onTap: () {
              // TODO: Navigate to detail
            },
            onAddTap: () {
              HapticFeedback.lightImpact();
              context.read<HomeScreenCubit>().addToCart(meal.id);
            },
            onFavoriteTap: () {
              context.read<HomeScreenCubit>().toggleFavorite(meal.id);
            },
          );
        },
      ),
    );
  }
}
