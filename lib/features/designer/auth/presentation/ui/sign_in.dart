import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender4/core/theme/extension.dart';
import 'package:lavender4/features/production/home/presentation/ui/base_page.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../commen/global_widgets/app_image.dart';
import '../../../../../commen/global_widgets/app_text.dart';
import '../../../../../commen/theme/color_schemes.g.dart';
import '../../../../../generated/assets.dart';
import '../../presentation/ui/forget_password.dart';
import '../bloc/auth_bloc.dart';
import '../widget/custom_reactive_textfield.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  // static const String path = '/';
  // static const String name = 'SignIn';
  //
  // static Widget pageBuilder(BuildContext context, GoRouterState state) {
  //   return SignIn();
  // }

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
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
                        top: 25.h,
                        left: 15.w,
                        child: AppText.displayMedium(
                          "Sign_in".tr(),
                          fontWeight: FontWeight.w400,
                          color: lightColorScheme.primary,
                          style: TextStyle(fontFamily: 'Recurisive'),
                        ))
                  ],
                ),
              ),
              Positioned(
                  top: -18.h,
                  left: 10.w,
                  right: 15.w,
                  child: Stack(
                    children: [
                      AppImage.asset(
                        Assets.iconsVector2,
                        height: 700.h,
                      ),
                      PositionedDirectional(
                          start: 30.w,
                          top: 260.h,
                          child: ReactiveForm(
                              formGroup: bloc.signIn,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Username'.tr(),style: TextStyle(fontFamily: 'Recurisive',fontSize: 18),),
                                  3.verticalSpace,
                                  CustomReactiveForm(
                                    formControlName: 'email',
                                    suffixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey,
                                      size: 13.h,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  5.verticalSpace,
                                  Text('Password'.tr(),style: TextStyle(fontFamily: 'Recurisive',fontSize: 18),),
                                  5.verticalSpace,
                                  CustomReactiveForm(
                                    formControlName: 'password',

                                    suffixIcon: Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                      size: 16.h,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                  5.verticalSpace,
                                  // Text('Mobile_Number'.tr(),style: TextStyle(fontFamily: 'Recurisive',fontSize: 18),),
                                  // 5.verticalSpace,
                                  // CustomReactiveForm(
                                  //   formControlName: 'password',
                                  //
                                  //   suffixIcon: Icon(
                                  //     Icons.phone_android,
                                  //     color: Colors.grey,
                                  //     size: 16.h,
                                  //   ),
                                  //   keyboardType: TextInputType.number,
                                  // ),
                                  // 5.verticalSpace,
                                  RSizedBox(
                                    height: 35.h,
                                    width: 300.w,
                                    child: Row(children: [
                                      Checkbox(
                                        value: isCheck,
                                        activeColor:
                                        context.colorScheme.primary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(4.sp)),
                                        onChanged: (value) {
                                          setState(() {
                                            isCheck = value!;
                                          });
                                        },
                                      ),
                                      AppText.bodyMedium(
                                        "Remember_me".tr(),
                                      ),
                                      TextButton(
                                          onPressed: () {

                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>ForgetPassword() ));
                                            // context
                                            //     .pushNamed(ForgetPassword.name),
                                          } ,
                                          child: AppText.bodyMedium(
                                            "Forget_Password".tr(),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.purple.shade700,
                                          )),
                                    ]),
                                  ),
                                  Padding(
                                    padding: REdgeInsetsDirectional.only(
                                        start: 220, top: 30),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BasePage(selectedItems: [],namePage: 'sign',)),
                                        );
                                      },
                                      child: AppImage.asset(
                                        Assets.iconsGroup,
                                        height: 60.h,
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                    ],
                  )),
            ],
          )),
    );
  }
}
