import 'package:get/get.dart';
import 'package:grooce/modules/cart/controllers/cart_controller.dart';
import 'package:grooce/modules/favorite/controllers/favorite_controller.dart';
import 'package:grooce/modules/home/controllers/home_controller.dart';
import 'package:grooce/modules/profile/controllers/profile_controller.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabsController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => FavoriteController());
    Get.lazyPut(() => ProfileController());
  }
}
