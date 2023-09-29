import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/ui/app_button.dart';
import 'package:grooce/ui/counter_view.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import '../../../ui/quantity_label.dart';
import '../../../utils/utils.dart';
import '../controllers/item_detail_controller.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class ItemDetailsView extends GetView<ItemDetailsController> {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Item Details'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(context),
          20.verticalSpace,
          Text(
            controller.item().name ?? '',
            style: kSemiBold18,
          ),
          20.verticalSpace,
          Row(
            children: [
              Obx(
                () => CounterWidget(
                  key: controller.counterKey,
                  counter: controller.counter(),
                ),
              ),
              const Spacer(),
              Text(
                'Rs. ${controller.item().price}',
                style: kSemiBold20,
              ),
            ],
          ),
          20.verticalSpace,
          Text(
            loremIpsum(
              paragraphs: 1,
              words: 40,
            ),
            style: kNormal14,
          ),
          const Spacer(),
          Column(
            children: [
              AppButton(
                onPressed: controller.addToCart,
                text: 'Add to Cart',
                type: AppButtonWidthType.full,
                colorType: AppButtonColorType.secondary,
              ),
              20.verticalSpace,
              AppButton(
                onPressed: () {},
                text: 'Buy Now',
                type: AppButtonWidthType.full,
                colorType: AppButtonColorType.primary,
              ),
            ],
          )
        ],
      ).paddingAll(20.r),
    );
  }

  _buildBanner(BuildContext context) => Container(
        margin: REdgeInsets.symmetric(vertical: 5, horizontal: 1),
        padding: REdgeInsets.all(15.r),
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).colorScheme.onInverseSurface,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-5.w, 5.h),
                  blurRadius: 8.r,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.2))
            ],
            image: DecorationImage(
              image: NetworkImage(controller.item().imgRef ?? ''),
              scale: 5.r,
            )),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: QuantityLabel(
                qntLabel: '1 KG',
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Obx(
                () => IconButton(
                  onPressed: () async {
                    await Utils.handleFavorite(controller.item());
                    controller.item.refresh();
                  },
                  icon: Icon((controller.item().isFavorite ?? false)
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart),
                  color: (controller.item().isFavorite ?? false)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onBackground,
                  iconSize: 25.r,
                  padding: const EdgeInsets.all(0),
                ),
              ),
            ),
          ],
        ),
      );
}
