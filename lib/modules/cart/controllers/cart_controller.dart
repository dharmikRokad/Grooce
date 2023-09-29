import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grooce/data/helpers/firestore_helper.dart';

class CartController extends GetxController {
  final Stream<QuerySnapshot<Map<String, dynamic>>>? cartStream =
      FirestoreHelper.getAllCartItems();
}
