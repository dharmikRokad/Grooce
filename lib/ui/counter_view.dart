import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grooce/data/config/logger.dart';

import '../utils/constants/text_styles.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  late RxInt count;

  @override
  void initState() {
    count = widget.counter.obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            count() > 1 ? count.value-- : null;
            logD(count);
          },
          icon: const Icon(Icons.remove),
        ),
        Obx(
          () => Text(
            count().toString(),
            style: kMedium20,
          ).paddingSymmetric(horizontal: 10.w),
        ),
        IconButton(
          onPressed: () {
            count.value++;
            logD(count);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
