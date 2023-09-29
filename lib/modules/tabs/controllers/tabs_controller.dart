import 'package:get/get.dart';
import 'package:grooce/modules/cart/controllers/cart_controller.dart';
import 'package:grooce/modules/home/controllers/home_controller.dart';
import 'package:grooce/modules/profile/controllers/profile_controller.dart';
import '../../favorite/controllers/favorite_controller.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onTabChanged(int value) {
    currentIndex(value);
    switch (value) {
      case 0:
        Get.put(HomeController);
        break;

      case 1:
        Get.put(FavoriteController);
        break;

      case 2:
        Get.put(CartController);
        break;

      case 3:
        Get.put(ProfileController);
        break;
    }
  }
}
