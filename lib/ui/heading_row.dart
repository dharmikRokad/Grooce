import 'package:flutter/cupertino.dart';
import 'package:grooce/ui/txt_icon_btn.dart';

class HeadingRow extends StatelessWidget {
  const HeadingRow({
    super.key,
    required this.heading,
    required this.onMore,
    this.addButton,
  });

  final String heading;
  final VoidCallback? onMore;
  final bool? addButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        (addButton ?? true)
            ? TextIconButton(
                onPressed: onMore ?? (){},
                text: 'View All',
                icon: CupertinoIcons.right_chevron,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
