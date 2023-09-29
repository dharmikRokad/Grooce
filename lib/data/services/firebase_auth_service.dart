import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthService {
  static FirebaseAuth fireAuth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<User?> signUpWithEmail(String email, String password) async {
    UserCredential userCredential =
        await fireAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<User?> signInWithEmail(String email, String password) async {
    UserCredential userCredential = await fireAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }

  static signOutFromApp() async {
    await fireAuth.signOut();
  }
}
