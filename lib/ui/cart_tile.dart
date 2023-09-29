import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grooce/data/helpers/firestore_helper.dart';
import 'package:grooce/ui/app_snackbar.dart';
import 'package:grooce/ui/counter_view.dart';
import 'package:grooce/utils/constants/text_styles.dart';
 
import '../data/models/product.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 20,
      // tileColor: Theme.of(context).colorScheme.onInverseSurface,
      leading: Container(
        width: 60.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            image: NetworkImage(product.imgRef ?? ''),
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.name ?? '',
            style: kSemiBold16,
          ),
          InkWell(
              onTap: () async {
                await FirestoreHelper.removeFromCart(product.id ?? '');
                appSnackbar(
                    message: 'Item removed from cart successfully.',
                    snackbarState: SnackbarState.success);
              },
              child: const Icon(Icons.close))
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CounterWidget(counter: product.cartCount ?? 1),
          TextButton(
            onPressed: () {},
            child: Text('Rs. ${product.price}', style: kSemiBold16,),
          ),
        ],
      ),
    );
  }
}
