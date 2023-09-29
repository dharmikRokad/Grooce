import 'package:get/get.dart';
import '../controllers/all_products_controller.dart';

class AllProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllProductsController());
  }
}
