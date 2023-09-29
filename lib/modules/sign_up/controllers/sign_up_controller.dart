import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:grooce/routes/app_routes.dart';
import 'package:grooce/ui/app_snackbar.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/services/firebase_auth_service.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxBool isPassVisible = false.obs;
  RxBool isTermsAccepted = false.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool isGoogleLoading = false.obs;

  RxBool get isFormValidate =>
      ((formKey.currentState?.validate() ?? false) && isTermsAccepted()).obs;

  void onCheckBoxTapped(bool? value) {
    isTermsAccepted(value);
  }

  void onPassHideTap() {
    isPassVisible(!isPassVisible());
  }

  void onSignUpClick() async {
    if (isFormValidate()) {
      isSignUpLoading(true);
      try {
        final User? user = await FireAuthService.signUpWithEmail(
          emailController.text,
          passController.text,
        );

        if (user != null) {
          await UserProviderController.onLogin(user, nameController.text);
          _moveNext();
        }
      } on FirebaseAuthException catch (e) {
        isSignUpLoading(false);
        if (e.code == "weak-password") {
          formKey.currentState?.fields['pass']?.invalidate(
              'Password should be at least 6 characters, 1 capital, 1 number, 1 sign.');
        } else if (e.code == "email-already-in-use") {
          formKey.currentState?.fields['email']?.invalidate(
              'Email address is already in use by another account.');
        } else {
          formKey.currentState?.fields['email']
              ?.invalidate('Enter valid email.');
        }
      } finally {
        isSignUpLoading(false);
      }
    }
  }

  void onSignUpWithGoogle() async {
    isGoogleLoading(true);
    try {
      User? user =
          await FireAuthService.signInWithGoogle().then((value) => value.user);

      if (user != null) {
        await UserProviderController.onLogin(user, user.displayName ?? '');
        _moveNext();
      }
    } on FirebaseAuthException catch (e) {
      isGoogleLoading(false);
      appSnackbar(
          message: e.message ?? '', snackbarState: SnackbarState.danger);
    } finally {
      isGoogleLoading(false);
    }
  }

  void _moveNext() {
    Get.offAllNamed(AppRoutes.tabs);
    appSnackbar(
        message: 'Signed up successfully.',
        snackbarState: SnackbarState.success);
  }

  void onLoginClick() {
    Get.offNamed(AppRoutes.login);
  }
}
