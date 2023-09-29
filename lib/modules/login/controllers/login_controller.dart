import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:grooce/routes/app_routes.dart';
import 'package:grooce/ui/app_snackbar.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/services/firebase_auth_service.dart';

class LoginController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool isPassVisible = false.obs;
  RxBool isLoginLoading = false.obs;

  RxBool get isFormValidate => (formKey.currentState?.validate() ?? false).obs;

  void onPassHideTap() {
    isPassVisible(!isPassVisible());
  }

  void onLoginClick() async {
    if (isFormValidate()) {
      isLoginLoading(true);
      try {
        final User? user = await FireAuthService.signInWithEmail(
            emailController.text, passController.text);
        if (user != null) {
          await UserProviderController.onLogin(user, '').then(
                (value) async => await UserProviderController.getNameAndPic(),
          );
          _moveNext();
        }
      } on FirebaseAuthException catch (e) {
        isLoginLoading(false);
        if (e.code == "user-not-found") {
          formKey.currentState?.fields['email']
              ?.invalidate('No user found with this email.');
        } else if (e.code == "wrong-password") {
          formKey.currentState?.fields['pass']
              ?.invalidate('Entered wrong password.');
        } else {
          formKey.currentState?.fields['email']
              ?.invalidate('Enter valid email');
        }
      } finally {
        isLoginLoading(false);
      }
    }
  }

  void _moveNext() {
    Get.offAllNamed(AppRoutes.tabs);
    appSnackbar(message: 'Logged in successfully.', snackbarState: SnackbarState.success);
  }

  void onSignUpClick() {
    Get.offNamed(AppRoutes.signUp);
  }
}
