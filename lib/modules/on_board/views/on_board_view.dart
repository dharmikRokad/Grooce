import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/data/config/app_assets.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import 'package:grooce/ui/app_button.dart';
import '../controllers/on_board_controller.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                AppAssets.onBoard,
              ),
              fit: BoxFit.cover,
            )),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome\nto our store',
                  textAlign: TextAlign.center,
                  style: kSemiBold45.copyWith(color: Colors.white),
                ),
                10.verticalSpace,
                Text(
                  'Get your groceries in as fast as one hour',
                  style: kNormal16.copyWith(color: Colors.white),
                ),
                20.verticalSpace,
                AppButton(
                  onPressed: controller.onContinue,
                  text: 'Get Started',
                  type: AppButtonWidthType.full,
                  colorType: AppButtonColorType.primary,
                ),
                20.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}
