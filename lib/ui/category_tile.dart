import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import '../data/models/category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: REdgeInsets.all(15),
            alignment: Alignment.center,
            height: 80.r,
            width: 80.r,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.2))
              ],
              image: DecorationImage(
                image: NetworkImage(category.img ?? ''),
                scale: MediaQuery.of(context).size.height * 0.015,
              ),
            ),
          ),
          Text(
            category.name ?? '',
            style: kMedium16,
          ),
        ],
      ),
    );
  }
}
