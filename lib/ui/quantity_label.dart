import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constants/text_styles.dart';

class QuantityLabel extends StatelessWidget {
  const QuantityLabel({
    super.key,
    required this.qntLabel,
  });

  final String qntLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
      ),
      child: Text(
        qntLabel,
        style: kMedium14,
      ),
    );
  }
}
