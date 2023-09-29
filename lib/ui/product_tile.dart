import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import '../data/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavorite,
  });

  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-5.w, 5.h),
                      blurRadius: 8.r,
                      color: Colors.black.withOpacity(0.2))
                ],
                image: DecorationImage(
                  image: NetworkImage(product.imgRef ?? ''),
                  // fit: BoxFit.contain,
                  scale: 10.r,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: onFavorite,
                  icon: Icon((product.isFavorite ?? false)
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart),
                  color: (product.isFavorite ?? false)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onBackground,
                  iconSize: 20.r,
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
            15.verticalSpace,
            Text(
              product.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: kSemiBold16.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            5.verticalSpace,
            Text(
              'Rs. ${product.price.toString() ?? ''}',
              style: kSemiBold14,
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
    );
  }
}
