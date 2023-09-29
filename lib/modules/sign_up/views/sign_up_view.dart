import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import 'package:grooce/utils/extensions/string_extension.dart';
import 'package:grooce/utils/extensions/widget_extension.dart';
import '../../../data/config/app_assets.dart';
import '../../../ui/app_button.dart';
import '../../../ui/app_txt_field.dart';
import '../../../ui/hyper_link_text.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            children: [
              50.verticalSpace,
              AppTextField(
                name: 'name',
                controller: controller.nameController,
                hintText: 'Name',
                validator: FormBuilderValidators.required(),
              ),
              AppTextField(
                name: 'email',
                controller: controller.emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!value.toString().isValidEmail) {
                    return 'Enter valid email.';
                  }
                  return null;
                },
              ),
              Obx(
                () => AppTextField(
                  name: 'pass',
                  controller: controller.passController,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(controller.isPassVisible()
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_solid),
                    onPressed: controller.onPassHideTap,
                  ),
                  obSecureText: !controller.isPassVisible(),
                  validator: (value) {
                    if (!value.toString().isValidPassword) {
                      return 'password should contains 6 characters, with 1 Capital letter, 1 numeric, 1 sign.';
                    }
                    return null;
                  },
                ),
              ),
              FormBuilderCheckbox(
                name: 'terms',
                validator: (value) {
                  if (value ?? false) {
                    return null;
                  }
                  return 'Accept terms';
                },
                onChanged: controller.onCheckBoxTapped,
                title: Text(
                  'By signing up, you are agree to Terms of the service and Privacy Policy',
                  style:
                      kMedium14,
                ),
              ),
              20.verticalSpace,
              Obx(
                () => AppButton(
                  onPressed: () {
                    controller.onSignUpClick();
                  },
                  isLoading: controller.isSignUpLoading(),
                  text: 'Sign Up',
                  type: AppButtonWidthType.full,
                  colorType: AppButtonColorType.primary,
                ),
              ),
              15.verticalSpace,
              Text(
                'Or with',
                style: kSemiBold16.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              15.verticalSpace,
              Obx(
                () => AppButton(
                  onPressed: controller.onSignUpWithGoogle,
                  isLoading: controller.isGoogleLoading(),
                  text: 'Sign up with Google',
                  icon: Image.asset(AppAssets.google),
                  type: AppButtonWidthType.full,
                  colorType: AppButtonColorType.secondary,
                ),
              ),
              15.verticalSpace,
              HyperLinkText(
                text: 'Already have an account ?',
                linkedText: 'Login',
                onPressed: controller.onLoginClick,
              ),
            ],
          ).paddingSymmetric(horizontal: 20, vertical: 10),
        ),
      ),
    ).addHideKeyboard();
  }
}
