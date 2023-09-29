import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grooce/ui/txt_icon_btn.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import '../data/models/product.dart';

class HorizontalTile extends StatelessWidget {
  const HorizontalTile({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 20.h,
      leading: Container(
        width: 60.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(product.imgRef ?? ''),
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        product.name ?? '',
        style: kSemiBold16,
      ),
      subtitle: Text(
        loremIpsum(
          paragraphs: 1,
          words: 5,
        ),
        style: kNormal14,
      ),
      subtitleTextStyle: kNormal14,
      trailing: TextIconButton(
        onPressed: () {},
        icon: CupertinoIcons.right_chevron,
        text: 'Rs. ${product.price}',
      ),
    ).paddingSymmetric(vertical: 10.h);
  }
}
