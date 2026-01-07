import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const PrimaryButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.brandonGrotesque,
            color: AppColors.pureWhite,
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

@Preview(name: 'Primary Button Preview')
Widget primaryButtonPreview() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        PrimaryButton(text: "Login"),
        SizedBox(height: 16),
        PrimaryButton(text: "Sign Up"),
      ],
    ),
  );
}
