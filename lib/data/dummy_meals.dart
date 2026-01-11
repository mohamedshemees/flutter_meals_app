import 'package:food_store_flutter/domain/entity/meal.dart';
import 'package:food_store_flutter/domain/repository/meals_repository.dart';

import '../presentation/design_system/assets_utils/app_assets.dart';
import '../presentation/design_system/assets_utils/app_strings.dart';

final List<Meal> dummyMeals = [
  Meal(
    id: '1',
    name: AppStrings.quinoaFruitSalad,
    categoryId: 1,
    image: AppAssets.imgBreakfastQuinoa,
    price: 10.0,
    description: AppStrings.quinoaFruitSaladDescription,
    ingredients: ['Red Quinoa', 'Lime', 'Honey', 'Blueberries', 'Strawberries', 'Mango', 'Fresh mint'],
    tags: [AppStrings.hottest, AppStrings.popular],
    isFavorite: true,
  ),
  Meal(
    id: '2',
    name: AppStrings.tropicalFruitSalad,
    categoryId: 1,
    image: AppAssets.imgTropicalFruitSalad,
    price: 12.0,
    description: 'A delicious and refreshing mix of tropical fruits.',
    ingredients: ['Pineapple', 'Papaya', 'Mango', 'Kiwi'],
    tags: [AppStrings.newCombo, AppStrings.top],
    isFavorite: false,
  ),
  Meal(
    id: '3',
    name: AppStrings.honeyLimeCombo,
    categoryId: 2,
    image: AppAssets.imgHoneyLimePeach,
    price: 8.0,
    description: 'A sweet and tangy fruit salad with a honey-lime dressing.',
    ingredients: ['Peaches', 'Grapes', 'Mint', 'Honey', 'Lime'],
    tags: [AppStrings.recommendedCombo],
    isFavorite: true,
  ),
  Meal(
    id: '4',
    name: AppStrings.melonFruitSalad,
    categoryId: 1,
    image: AppAssets.imgFruitBasket1,
    price: 9.5,
    description: 'A simple yet delicious fruit salad with a variety of melons.',
    ingredients: ['Watermelon', 'Cantaloupe', 'Honeydew'],
    tags: [],
    isFavorite: false,
  ),
];
