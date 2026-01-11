import 'package:flutter/material.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_assets.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onBasketTap;
  final VoidCallback onMenuTap;

  const HomeHeader({
    super.key,
    required this.onBasketTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onMenuTap,
            borderRadius: BorderRadius.circular(8),
            child:  Image.asset(
              AppAssets.icMenu,
              width: 22,
              height: 11,
              color: AppColors.darkBlue,
            ),
          ),
          InkWell(
            onTap: onBasketTap,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                 Image.asset(
                  AppAssets.icBasket,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  AppStrings.myBasket,
                  style: const TextStyle(
                    fontFamily: AppFonts.brandonGrotesque,
                    fontSize: 10,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
