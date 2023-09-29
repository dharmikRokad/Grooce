import 'package:flutter/material.dart';
import 'package:grooce/utils/utils.dart';

extension ScreenUtilExtension on Widget {
  Widget addHideKeyboard() => GestureDetector(
        onTap: () {
          Utils.hideKeyboard();
        },
        child: this,
      );
}
