import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender4/commen/theme/color_schemes.g.dart';
import 'package:lavender4/core/theme/typography.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveForm extends StatelessWidget {
  const CustomReactiveForm({
    super.key,
    required this.formControlName,
    required this.keyboardType,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.constraints, this.textAlign,
    required this.controller
  });


  final String formControlName;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? constraints;
  final TextAlign? textAlign;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      keyboardType: keyboardType,
      formControlName: formControlName,
      textAlign:textAlign?? TextAlign.start,
      obscureText: obscureText,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        constraints: constraints ??
            BoxConstraints(
              maxWidth: 280.w,
              minWidth: 280.w,
            ),
        contentPadding: REdgeInsetsDirectional.all(8),
        hintText: hintText,
        hintStyle: textTheme.bodySmall,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
            gapPadding: 60,
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: lightColorScheme.error,
            )),
      ),
    );
  }
}
