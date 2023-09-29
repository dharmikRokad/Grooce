import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grooce/data/helpers/firestore_helper.dart';


class FavoriteController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>>? favoriteStream =
      FirestoreHelper.getFavorites();
}
