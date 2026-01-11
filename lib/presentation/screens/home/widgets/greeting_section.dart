import 'package:flutter/material.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';

class GreetingSection extends StatelessWidget {
  final String userName;

  const GreetingSection({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 60.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${AppStrings.homeHello} $userName',
              style: const TextStyle(
                fontFamily: AppFonts.brandonGrotesque,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            TextSpan(
              text: AppStrings.homeWelcome,
              style: TextStyle(
                fontFamily: AppFonts.brandonGrotesque,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
