import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grooce/utils//constants/firestore_consts.dart';
import '../models/product.dart';
import '../providers/user_provider.dart';

class FirestoreHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> users =
      firestore.collection(FirestoreConsts.users);
  static CollectionReference<Map<String, dynamic>> categories =
      firestore.collection(FirestoreConsts.categories);
  static CollectionReference<Map<String, dynamic>> products =
      firestore.collection(FirestoreConsts.products);
  static CollectionReference<Map<String, dynamic>> userProducts = users
      .doc(UserProviderController.uid)
      .collection(FirestoreConsts.products);

  /// Method to add users data like all products to firestore
  static Future<void> addUser(User user, String name) async {
    users.doc(user.uid).set(
        {'email': user.email, 'uid': user.uid, 'name': name, 'imgRef': ''});

    userProducts = users.doc(user.uid).collection(FirestoreConsts.products);

    await products.get().then((value) async {
      for (QueryDocumentSnapshot<Map<String, dynamic>> element in value.docs) {
        await userProducts.doc(element.id).set(Product(
              isFavorite: false,
              isInCart: false,
              cartCount: 0,
              id: element.id,
              price: element.data()['price'],
              category: element.data()['category'],
              imgRef: element.data()['imgRef'],
              name: element.data()['name'],
            ).toJson());
      }

      // value.docs.forEach((element) async {
      //   await userProducts
      //       .doc(element.id)
      //       .set(Product.fromJson(element.data()).toJson());
      // });
    });
  }

  /// to Update profile pic
  static Future<void> updateProfilePic(String path) async =>
      await users.doc(UserProviderController.uid).update({'imgRef': path});

  /// to Get current profile pic
  static Future<String> getProfilePic() async => await users
      .doc(UserProviderController.uid)
      .get()
      .then((value) => value.data()?['imgRef']);

  /// to Update name
  static Future<void> updateName(String name) async =>
      await users.doc(UserProviderController.uid).update({'name': name});

  ///to Get current name
  static Future<String> getName() async {
    return await users
        .doc(UserProviderController.uid)
        .get()
        .then((value) => value.data()?['name']);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() =>
      categories.snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>>? getProducts() =>
      userProducts.snapshots();

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getCategoryWiseProducts(String category) async {
    final querySnapshot =
        await userProducts.where('category', isEqualTo: category).get();
    return querySnapshot.docs;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? getFavorites() =>
      userProducts.where('is_favorite', isEqualTo: true).snapshots();

  static addToFavorites(String productId) async =>
      await userProducts.doc(productId).update({'is_favorite': true});

  static removeFavorites(String productId) async =>
      await userProducts.doc(productId).update({'is_favorite': false});

  static addToCart(String productId, int quantity) async => await userProducts
      .doc(productId)
      .update({'in_cart': true, 'count': quantity});

  static removeFromCart(String productId) async =>
      await userProducts.doc(productId).update({'in_cart': false, 'count': 0});

  static Stream<QuerySnapshot<Map<String, dynamic>>>? getAllCartItems() =>
      userProducts.where('in_cart', isEqualTo: true).snapshots();
}
