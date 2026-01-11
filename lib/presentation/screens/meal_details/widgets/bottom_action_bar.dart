import 'package:flutter/material.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';

class BottomActionBar extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToBasket;

  const BottomActionBar({
    super.key,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onAddToBasket,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          InkWell(
            onTap: onFavoriteTap,
            borderRadius: BorderRadius.circular(28),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 24,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: InkWell(
              onTap: onAddToBasket,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    AppStrings.addToBasket,
                    style: const TextStyle(
                      fontFamily: AppFonts.brandonGrotesque,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.pureWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
