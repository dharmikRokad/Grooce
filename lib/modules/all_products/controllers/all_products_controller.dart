import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grooce/data/config/logger.dart';
import 'package:grooce/data/helpers/firestore_helper.dart';

class AllProductsController extends GetxController {
  String title = '';
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> products =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    isLoading(true);
    if (Get.arguments != null && Get.arguments is Map<String, dynamic>) {
      final Map<String, dynamic> map = Get.arguments;
      title = map['title'];

      final categories = map['category'] as List<String>;
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> allProducts = [];

      for (String category in categories) {
        final categoryProds =
            await FirestoreHelper.getCategoryWiseProducts(category);
        allProducts.addAll(categoryProds ?? []);
      }

      products(allProducts);
      logI(products);
    }
    isLoading(false);
    super.onInit();
  }
}
