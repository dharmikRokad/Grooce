import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/data/models/product.dart';
import 'package:grooce/routes/app_routes.dart';
import 'package:grooce/ui/horizontal_tile.dart';
import '../../../data/config/logger.dart';
import '../../../ui/heading_row.dart';
import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title ?? ''),
      ),
      body: Obx(
        () => controller.isLoading()
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
          padding: REdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                shrinkWrap: true,
                itemCount: controller.products().length,
                itemBuilder: (context, index) =>
                    _productTileBuilder(controller.products()[index]),
                separatorBuilder: (context, index) => const Divider(),
              ),
      ),
    );
  }

  Widget _productTileBuilder(QueryDocumentSnapshot<Map<String, dynamic>> e) {
    final Product product = Product.fromJson(e.data(), e.id);
    return HorizontalTile(
      product: product,
      onTap: () {
        Get.toNamed(AppRoutes.itemDetail, arguments: product);
      },
    );
  }
}
