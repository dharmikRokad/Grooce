import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grooce/routes/app_routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> logoAnimation;
  late Animation<double> textAnimation;

  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: 1.seconds);

    logoAnimation = Tween<double>(begin: -1.r, end: 0.4.sh).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    textAnimation = Tween<double>(begin: 0.sp, end: 40.sp).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );

    animationController.forward();

    Future.delayed(1.5.seconds, () {
      Get.offNamed(AppRoutes.onBoard);
    },);

    super.onInit();
  }
}
