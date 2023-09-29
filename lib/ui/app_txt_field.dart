import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.name,
    this.labelText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.hintText,
    this.controller,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
    this.obSecureText,
    this.style,
    this.labelStyle,
    this.border,
    this.contentPadding,
  });

  final String? labelText;
  final String? name;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final Function(String?)? onChanged;
  final void Function()? onTap;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obSecureText;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        labelText?.isNotEmpty ?? false
            ? Container(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText ?? '',
            style: labelStyle ?? Theme.of(context).textTheme.titleMedium,
          ),
        ).paddingSymmetric(horizontal: 10)
            : Container(),
        5.h.verticalSpace,
        SizedBox(
          // height: 56.h,
          width: 343.w,
          child: FormBuilderTextField(
            name: name!,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            controller: controller,
            autovalidateMode: autoValidateMode,
            obscureText: obSecureText ?? false,
            style: style,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixText: prefixText,
              prefixStyle: style,
              suffixIcon: suffixIcon,
              hintText: hintText,
              contentPadding: contentPadding ??
                  REdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
              border: border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              filled: controller.isBlank ?? false,
            ),
            validator: validator,
            onTap: onTap,
            onChanged: onChanged,
          ),
        )
      ],
    ).paddingOnly(bottom: 25);
  }
}
