import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grooce/utils/constants/text_styles.dart';

class HyperLinkText extends StatelessWidget {
  const HyperLinkText({
    super.key,
    required this.text,
    required this.linkedText,
    required this.onPressed,
    this.textColor,
    this.linkColor,
  });

  final String text;
  final String linkedText;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? linkColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: kMedium16.copyWith(
            color: textColor ?? Theme.of(context).colorScheme.onBackground,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: REdgeInsets.all(5),
            foregroundColor: linkColor ?? Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            linkedText,
            style: kMedium16,
          ),
        ),
      ],
    );
  }
}
