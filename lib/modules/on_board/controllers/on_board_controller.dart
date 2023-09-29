import 'package:get/get.dart';
import 'package:grooce/routes/app_routes.dart';

class OnBoardController extends GetxController {

  void onContinue() {
    Get.toNamed(AppRoutes.signUp);
  }

}
