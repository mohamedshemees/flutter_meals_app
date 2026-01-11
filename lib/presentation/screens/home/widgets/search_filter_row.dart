import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_assets.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';

class SearchFilterRow extends StatelessWidget {
  final VoidCallback onFilterTap;

  const SearchFilterRow({
    super.key,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                style: const TextStyle(
                  fontFamily: AppFonts.brandonGrotesque,
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: AppStrings.searchForFruitSaladCombos,
                  hintStyle: const TextStyle(
                    fontFamily: AppFonts.brandonGrotesque,
                    fontSize: 14,
                    color: AppColors.hint,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.hint,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: onFilterTap,
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 24,
              height: 17,
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.icFilter,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
