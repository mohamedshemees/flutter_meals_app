import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_store_flutter/domain/repository/cart_repository.dart';
import 'package:food_store_flutter/presentation/design_system/app_colors.dart';
import 'package:food_store_flutter/presentation/design_system/widgets/outlined_button.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entity/meal.dart';
import '../../../main.dart';
import '../../design_system/app_fonts.dart';
import '../../design_system/assets_utils/app_assets.dart';
import '../../design_system/assets_utils/app_strings.dart';
import '../../design_system/widgets/primayButton.dart';
import 'cart_screen_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartScreenCubit(getIt<CartRepository>())..getCartItems(),
      child: BlocBuilder<CartScreenCubit, CartScreenState>(
        builder: (context, state) {
          return Scaffold(
            persistentFooterDecoration: BoxDecoration(
              color: AppColors.pureWhite,
            ),
            backgroundColor: AppColors.pureWhite,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              top: false,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        buildTopBar(context:context,title:AppStrings.myBasket),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: state.meals.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildCartItem(meal: state.meals[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                                      height: .2,
                                      color: AppColors.hint,
                                      thickness: .3,
                                    ),
                          ),
                        ),
                        _buildFooter(state.totalPrice),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartItem({required Meal meal}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(meal.image, width: 65, height: 65),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        meal.name,
                        style: TextStyle(
                          color: AppColors.pureBlack,
                          fontFamily: AppFonts.brandonGrotesque,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.icCurrency,
                          width: 16,
                          height: 16,
                          colorFilter: ColorFilter.mode(
                            AppColors.darkBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          meal.price.toString(),
                          style: TextStyle(
                            color: AppColors.darkBlue,
                            fontFamily: AppFonts.brandonGrotesque,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${meal.quantity} ${AppStrings.packs}",
                  style: TextStyle(
                    color: AppColors.pureBlack,
                    fontFamily: AppFonts.brandonGrotesque,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(double price) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.total,
                style: TextStyle(
                  color: AppColors.pureBlack,
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.icCurrency,
                    width: 20,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      AppColors.darkBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontFamily: AppFonts.brandonGrotesque,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => _buildAddressBottomSheet(
                        context: context,
                        onPayWithCard: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) =>
                                _buildCreditCardBottomSheet(context),
                          );
                          _buildCreditCardBottomSheet(context);
                        },
                        onPayOnDelivery: () {
                          context.go("/order_completed");
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      AppStrings.checkout,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.brandonGrotesque,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: AppColors.pureWhite,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressBottomSheet({
    required BuildContext context,
    required void Function() onPayWithCard,
    required void Function() onPayOnDelivery,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabeledTextField(
                label: AppStrings.deliveryAddress,
                hintText: "10th avenue, Lekki, Lagos State",
              ),
              const SizedBox(height: 16),
              _buildLabeledTextField(
                label: AppStrings.numberWeCanCall,
                hintText: "09090605708",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOutlinedButton(
                      text: AppStrings.payOnDelivery,
                      onTap: () {
                        Navigator.of(context).pop();
                        onPayOnDelivery();
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomOutlinedButton(
                      text: AppStrings.payWithCard,
                      onTap: () {
                        Navigator.of(context).pop();
                        onPayWithCard();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -120,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.pureWhite,
                child: Icon(Icons.close, color: AppColors.pureBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCardBottomSheet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabeledTextField(
                label: AppStrings.cardHoldersName,
                hintText: "10th avenue, Lekki, Lagos State",
              ),
              const SizedBox(height: 16),
              _buildLabeledTextField(
                label: AppStrings.cardNumber,
                hintText: "09090605708",
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    child: _buildLabeledTextField(
                      label: AppStrings.date,
                      hintText: "10/30",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: _buildLabeledTextField(
                      label: AppStrings.ccv,
                      hintText: "123",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              PrimaryButton(text: AppStrings.completeOrder, onTap: () {}),
            ],
          ),
          Positioned(
            top: -120,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.pureWhite,
                child: Icon(Icons.close, color: AppColors.pureBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppFonts.brandonGrotesque,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.darkBlue,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF3F1F1),
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.hint),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
Widget buildTopBar({
  required BuildContext context,
  required String title}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
    decoration: BoxDecoration(color: AppColors.primary),
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppAssets.icChevronBack),
                const SizedBox(width: 4),
                Text(
                  AppStrings.goBack,
                  style: TextStyle(
                    color: AppColors.pureBlack,
                    fontFamily: AppFonts.brandonGrotesque,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.pureWhite,
              fontFamily: AppFonts.brandonGrotesque,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
      ],
    ),
  );
}

