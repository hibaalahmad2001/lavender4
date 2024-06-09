import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavender4/commen/global_widgets/app_text.dart';
import 'package:lavender4/core/theme/extension.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../commen/global_widgets/app_image.dart';
import '../../../../../commen/theme/color_schemes.g.dart';
import '../../../../../generated/assets.dart';
import '../bloc/auth_bloc.dart';
import '../widget/custom_reactive_textfield.dart';
import 'email_verification.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  static const String path = 'ForgetPassword';
  static const String name = "ForgetPassword";

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return ForgetPassword();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffebebeb),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: Stack(
                  children: [
                    AppImage.asset(
                      Assets.iconsVector6,
                    ),
                    Positioned(
                        top: 30.h,
                        left: 10.w,
                        child: AppText.headlineSmall(
                          "Forget_Password".tr(),
                          fontWeight: FontWeight.w400,
                          color: lightColorScheme.primary,
                          style: TextStyle(fontFamily: 'Recurisive'),
                        ))
                  ],
                ),
              ),
              PositionedDirectional(
                  start: 30.h,
                  end: 30.h,
                  top: 200,
                  child: ReactiveForm(
                    formGroup: context.read<AuthBloc>().resetPassword,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         AppText.headlineMedium(
                          "Mail_Address_Here".tr(),
                         fontWeight: FontWeight.w500,
                           style: TextStyle(fontFamily: 'Recurisive'),

                         ),
                        10.verticalSpace,
                        AppText.bodyMedium(
                          textAlign: TextAlign.center,
                          "Enter_the_Email_Address_with_associated_with_your_account".tr(),
                          style: TextStyle(fontFamily: 'Recurisive'),

                        ),
                        30.verticalSpace,
                         CustomReactiveForm(
                            formControlName: 'email',
                            hintText: 'email'.tr(),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            keyboardType: TextInputType.emailAddress),
                        20.verticalSpace,
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EmailVerification()));

                              // context.pushNamed(EmailVerification.name);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: lightColorScheme.primary,
                                fixedSize: Size(280.w, 30.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r))),
                            child: AppText.bodyMedium(
                              "Recover_password".tr(),
                              color: Colors.white,
                              style: TextStyle(fontFamily: 'Recurisive'),

                            ))
                      ],
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    AppImage.asset(
                      Assets.iconsVector3,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
