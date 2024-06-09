import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavender4/commen/global_widgets/app_text.dart';
import 'package:lavender4/core/theme/extension.dart';
import 'package:lavender4/features/production/home/presentation/ui/base_page.dart';
import '../../../../../commen/global_widgets/app_image.dart';
import '../../../../../commen/theme/color_schemes.g.dart';
import '../../../../../generated/assets.dart';
import '../widget/custom_pinput.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});

  static const String path = 'EmailVerification';
  static const String name = "EmailVerification";

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return EmailVerification();
  }

  final pinController = TextEditingController();

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
                          "Email_Verification".tr(),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.headlineMedium(
                      "Get_Your_Code".tr(),
                      style: TextStyle(fontFamily: 'Recurisive'),
                    ),
                    10.verticalSpace,
                    AppText.bodyMedium(
                      textAlign: TextAlign.center,
                      "Please_enter_the_4_digit_code_that_send_to_your_email_address".tr(),
                      style: TextStyle(fontSize: 16.sp,fontFamily: 'Recurisive'),

                    ),
                    30.verticalSpace,
                    CustomPinPut(pinController: pinController),
                    10.verticalSpace,
                    RichText(
                        text: TextSpan(
                            text: "if_you_don't_recieve_code!".tr(),
                            style: context.textTheme.bodyMedium,
                            children: [
                          TextSpan(
                              text: "Resend".tr(),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: context.colorScheme.primary,
                              fontWeight: FontWeight.w500))
                        ])),
                    20.verticalSpace,
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BasePage(namePage: 'namePage', selectedItems: [])));

                          // context.pushNamed(ResetPassword.name);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: lightColorScheme.primary,
                            fixedSize: Size(280.w, 30.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r))),
                        child: Text(
                          "Verify_and_Proceed".tr(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ))
                  ],
                ),
              ),
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
