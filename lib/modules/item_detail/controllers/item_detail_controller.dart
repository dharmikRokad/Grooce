import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grooce/data/helpers/firestore_helper.dart';
import 'package:grooce/data/models/product.dart';
import 'package:grooce/ui/app_snackbar.dart';
import '../../../ui/counter_view.dart';

class ItemDetailsController extends GetxController {
  late Rx<Product> item;

  RxInt counter = 1.obs;

  final GlobalKey<CounterWidgetState> counterKey =
      GlobalKey<CounterWidgetState>();

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Product) {
      item = (Get.arguments as Product).obs;
    }
    super.onInit();
  }

  Future<void> addToCart() async {
    if (item().isInCart ?? false) {
      appSnackbar(
          message: 'Item is already in cart.',
          snackbarState: SnackbarState.warning);
    } else {
      await FirestoreHelper.addToCart(
          item().id ?? '', counterKey.currentState?.count() ?? 1);
      appSnackbar(
          message: 'Item added to cart successfully.',
          snackbarState: SnackbarState.success);
      update();
      Get.forceAppUpdate();
    }
    item.refresh();
  }
}
