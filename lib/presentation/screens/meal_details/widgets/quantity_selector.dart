import 'package:flutter/material.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/app_fonts.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final double price;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.price,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: onDecrease,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: quantity > 1 ? AppColors.pureWhite : AppColors.searchBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: quantity > 1 ? AppColors.searchBackground : AppColors.hint,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: quantity > 1 ? AppColors.textPrimary : AppColors.hint,
                ),
              ),
            ),
            const SizedBox(width: 24),
            Text(
              quantity.toString(),
              style: const TextStyle(
                fontFamily: AppFonts.brandonGrotesque,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 24),
            InkWell(
              onTap: onIncrease,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        Text(
          '₦ ${price.toStringAsFixed(0)}',
          style: const TextStyle(
            fontFamily: AppFonts.brandonGrotesque,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
