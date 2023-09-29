import 'package:get/get.dart';
import '../controllers/item_detail_controller.dart';

class ItemDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDetailsController());
  }
}
