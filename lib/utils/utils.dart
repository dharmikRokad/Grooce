import 'package:flutter/material.dart';

import '../data/helpers/firestore_helper.dart';
import '../data/models/product.dart';

class Utils {
  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static handleFavorite(Product product) async {
    final bool isFav = product.isFavorite ?? false;
    isFav
        ? await FirestoreHelper.removeFavorites(product.id ?? '')
        : await FirestoreHelper.addToFavorites(product.id ?? '');
  }
}
