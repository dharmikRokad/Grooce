import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grooce/routes/app_routes.dart';
import 'package:grooce/utils/constants/enums/product_type.dart';
import '../../../data/helpers/firestore_helper.dart';
import '../../../data/models/product.dart';

class HomeController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> categoryStream =
      FirestoreHelper.getCategories();

  Stream<QuerySnapshot<Map<String, dynamic>>>? productStream =
      FirestoreHelper.getProducts();

  void onProduct(Product item) {
    Get.to(AppRoutes.itemDetail, arguments: item);
  }

  void onCategoryTap(String category) {
    Get.toNamed(
      AppRoutes.allProducts,
      arguments: {
        'title': category,
        'category': [category]
      },
    );
  }

  void onAllHotFireDeals() {
    Get.toNamed(
      AppRoutes.allProducts,
      arguments: {
        'title': 'Hot Fire Deals',
        'category': [ProductType.grocery.toString()]
      },
    );
  }

  void onAllKeellsDeals() {
    Get.toNamed(
      AppRoutes.allProducts,
      arguments: {
        'title': 'Keells Deals',
        'category': [
          ProductType.chilled.toString(),
          ProductType.household.toString()
        ]
      },
    );
  }
}
