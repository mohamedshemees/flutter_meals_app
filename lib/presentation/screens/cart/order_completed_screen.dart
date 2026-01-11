import 'package:flutter/material.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_assets.dart';
import 'package:food_store_flutter/presentation/design_system/assets_utils/app_strings.dart';
import 'package:go_router/go_router.dart';

import '../../design_system/app_colors.dart';
import '../../design_system/app_fonts.dart';
import '../../design_system/widgets/outlined_button.dart';
import '../../design_system/widgets/primayButton.dart';

class OrderCompletedScreen extends StatelessWidget {
  const OrderCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterDecoration: BoxDecoration(color: AppColors.pureWhite),
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 160.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(width: 164, height: 164, AppAssets.imgOrderAdded),
              const SizedBox(height: 56),
              Text(
                AppStrings.congratulations,
                style: const TextStyle(
                  fontFamily: AppFonts.brandonGrotesque,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.yourOrderHasBeenTaken,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: AppFonts.brandonGrotesque,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 56),
              PrimaryButton(text: AppStrings.trackOrder, onTap: () {
                context.go("/delivery_status_completed");

              }),
              const SizedBox(height: 48),
              CustomOutlinedButton(
                text: AppStrings.continueShopping,
                onTap: () {
                  context.go("/");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
