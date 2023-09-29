import 'package:get/get.dart';
import '../controllers/on_board_controller.dart';

class OnBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardController());
  }
}
