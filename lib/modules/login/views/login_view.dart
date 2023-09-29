import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/utils/extensions/string_extension.dart';
import 'package:grooce/utils/extensions/widget_extension.dart';
import '../../../ui/app_button.dart';
import '../../../ui/app_txt_field.dart';
import '../../../ui/hyper_link_text.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
                  validator: FormBuilderValidators.required(),
                ),
              ),
              30.verticalSpace,
              Obx(
                () => AppButton(
                  onPressed: controller.onLoginClick,
                  isLoading: controller.isLoginLoading(),
                  text: 'Login',
                  type: AppButtonWidthType.full,
                  colorType: AppButtonColorType.primary,
                ),
              ),
              30.verticalSpace,
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password ?',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              30.verticalSpace,
              HyperLinkText(
                text: 'Don\'t have an account ?',
                linkedText: 'Sign Up',
                onPressed: controller.onSignUpClick,
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    ).addHideKeyboard();
  }
}
