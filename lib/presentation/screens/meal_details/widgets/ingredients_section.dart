import 'package:flutter/material.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';

class IngredientsSection extends StatelessWidget {
  final List<String> ingredients;

  const IngredientsSection({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.onePackContains,
                  style: const TextStyle(
                    fontFamily: AppFonts.brandonGrotesque,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 150,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          ingredients.join(', '),
          style: const TextStyle(
            fontFamily: AppFonts.brandonGrotesque,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
