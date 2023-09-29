import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/data/config/logger.dart';
import 'package:grooce/routes/app_routes.dart';
import 'package:grooce/utils/constants/enums/product_type.dart';
import 'package:grooce/ui/heading_row.dart';
import 'package:grooce/utils/utils.dart';
import '../../../data/models/category.dart';
import '../../../data/models/product.dart';
import '../../../ui/category_tile.dart';
import '../../../ui/product_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: REdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHorizontalList(
              heading: 'Categories',
              stream: controller.categoryStream,
              tileBuilder: (QueryDocumentSnapshot<Map<String, dynamic>> e) =>
                  CategoryTile(
                category: Category.fromJson(e.data()),
                onTap: () {
                  controller
                      .onCategoryTap(e.data()['name'].toString().toLowerCase());
                },
              ),
              addButton: false,
            ),
            20.verticalSpace,
            _buildHorizontalList(
              heading: 'Hot Fire Members Deals',
              stream: controller.productStream,
              tileBuilder: _productTileBuilder,
              filterCondition: (p0) =>
                  p0.data()['category'] == ProductType.grocery.toString(),
              onMore: controller.onAllHotFireDeals,
            ),
            20.verticalSpace,
            _buildHorizontalList(
              heading: 'keells Deals',
              stream: controller.productStream,
              tileBuilder: _productTileBuilder,
              filterCondition: (p0) =>
                  (p0.data()['category'] == ProductType.household.toString() ||
                      p0.data()['category'] == ProductType.chilled.toString()),
              onMore: controller.onAllKeellsDeals,
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }

  Widget _buildHorizontalList({
    required String heading,
    required Widget Function(QueryDocumentSnapshot<Map<String, dynamic>>)
        tileBuilder,
    Stream<QuerySnapshot<Map<String, dynamic>>>? stream,
    bool Function(QueryDocumentSnapshot<Map<String, dynamic>>)? filterCondition,
    VoidCallback? onMore,
    bool? addButton,
  }) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          logI('loading categories');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          logI(snapshot.error);
          return Container(
            height: 100,
            color: Colors.red,
          );
        }

        if (snapshot.connectionState == ConnectionState.active) {
          final List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
              snapshot.data?.docs
                  .where((e) => filterCondition?.call(e) ?? true)
                  .take(5)
                  .toList();
          logI('loaded categories');
          return Column(
            children: [
              HeadingRow(
                  heading: heading, addButton: addButton, onMore: onMore),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data?.map(tileBuilder).toList() ?? [],
                ),
              )
            ],
          );
        }

        return Container();
      },
    );
  }

  Widget _productTileBuilder(QueryDocumentSnapshot<Map<String, dynamic>> e) {
    final Product product = Product.fromJson(e.data(), e.id);
    return ProductTile(
      product: product,
      onTap: () {
        Get.toNamed(AppRoutes.itemDetail, arguments: product);
      },
      onFavorite: () async {
        await Utils.handleFavorite(product);
      },
    );
  }
}
