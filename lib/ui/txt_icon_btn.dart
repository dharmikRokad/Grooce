import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    required this.onPressed,
    this.isTransparent = true,
    required this.text,
    required this.icon,
  });

  final VoidCallback onPressed;
  final bool isTransparent;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        onPressed: onPressed,
        style: isTransparent
            ? ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
        )
            : ElevatedButton.styleFrom(),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        icon: Icon(
          icon,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
