import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/ui/horizontal_tile.dart';
import 'package:grooce/utils/extensions/widget_extension.dart';
import '../../../data/config/logger.dart';
import '../../../data/models/product.dart';
import '../../../routes/app_routes.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: StreamBuilder(
        stream: controller.favoriteStream,
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
                snapshot.data?.docs.toList();
            logI('loaded categories');

            if (data?.isEmpty ?? false) {
              return const Center(
                child: Text('You haven\'t added any items to favorites yet.'),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: data?.map(_buildFavoriteTile).toList() ?? [],
              ),
            ).paddingSymmetric(horizontal: 20.w);
          }

          return Container();
        },
      ),
    ).addHideKeyboard();
  }

  Widget _buildFavoriteTile(QueryDocumentSnapshot<Map<String, dynamic>> e) {
    final Product product = Product.fromJson(e.data(), e.id);
    return HorizontalTile(
      product: product,
      onTap: () {
        Get.toNamed(AppRoutes.itemDetail, arguments: product);
      },
    );
  }
}
