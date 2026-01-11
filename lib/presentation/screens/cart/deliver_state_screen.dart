import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../design_system/app_colors.dart';
import '../../design_system/app_fonts.dart';
import '../../design_system/assets_utils/app_assets.dart';
import '../../design_system/assets_utils/app_strings.dart';
import 'cart_screen.dart';

class DeliveryStateScreen extends StatefulWidget {
  const DeliveryStateScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<DeliveryStateScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterDecoration: BoxDecoration(color: AppColors.pureWhite),
      backgroundColor: AppColors.pureWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: buildTopBar(
                  context: context, title: AppStrings.deliveryStatus),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildOrderStep(
                      title: orderStep[index].title,
                      icon: orderStep[index].icon,
                      status: orderStep[index].status,
                      subtitle: orderStep[index].subtitle,
                    );
                  },
                  childCount: 3,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(AppAssets.imgMap, height: 128),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 48 + 24,
                  vertical: 4,
                ),
                height: 40,
                width: double.infinity,
                child: CustomPaint(
                  painter: DashedLinePainter(color: AppColors.primary),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                child: _buildOrderStep(
                  title: AppStrings.orderReceived,
                  icon: AppAssets.imgOrderAdded,
                  status: "Done",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStep({
    required String title,
    String? subtitle,
    required String icon,
    required String status,
  }) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
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
                  child: Image.asset(icon, width: 65, height: 65),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.pureBlack,
                        fontFamily: AppFonts.brandonGrotesque,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                    Text(
                      subtitle ?? "",
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
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: status == "Done"
                      ? AppColors.success
                      : AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  status == "Done" ? AppAssets.icTick : AppAssets.icPhone,
                  width: 16,
                  height: 16,
                  color: AppColors.pureWhite,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 48,
              vertical: 4,
            ),
            height: 40,
            width: double.infinity,
            child: CustomPaint(
              painter: DashedLinePainter(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderStep {
  String title;
  String? subtitle;
  String icon;
  String status;

  OrderStep({
    this.subtitle,
    required this.title,
    required this.icon,
    required this.status,
  });
}

final orderStep = [
  OrderStep(
    title: AppStrings.orderTaken,
    icon: AppAssets.icOrderTaken,
    status: "Done",
  ),
  OrderStep(
    title: AppStrings.orderIsBeingPrepared,
    icon: AppAssets.icOrderProcessed,
    status: "Done",
  ),
  OrderStep(
    title: AppStrings.orderIsBeingDelivered,
    icon: AppAssets.icDeliveryMan,
    subtitle: AppStrings.yourDeliveryAgentIsComing,
    status: "PickedUp",
  ),
];

class DashedLinePainter extends CustomPainter {
  final double dashHeight;
  final double dashSpace;
  final Color color;

  DashedLinePainter({
    this.dashHeight = 4,
    this.dashSpace = 3,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    double startY = 0;
    final y = size.height;

    while (startY < y) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
