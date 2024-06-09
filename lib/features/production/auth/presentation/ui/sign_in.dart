import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lavender4/core/theme/extension.dart';
import 'package:lavender4/core/widgets/loding_widget.dart';
import 'package:lavender4/features/production/auth/presentation/widget/message_display_widget.dart';
import 'package:lavender4/features/production/home/presentation/ui/base_page.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../commen/global_widgets/app_image.dart';
import '../../../../../commen/global_widgets/app_text.dart';
import '../../../../../commen/theme/color_schemes.g.dart';
import '../../../../../generated/assets.dart';
import '../../../../designer/auth/presentation/ui/forget_password.dart';
import '../../domain/entities/auth.dart';
import '../../presentation/ui/forget_password.dart';
import '../bloc/auth_bloc.dart';
import '../widget/custom_reactive_textfield.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isCheck = false;
  late FormGroup formGroup; //// هنا نعرف الـ FormGroup
  @override
  void initState() {
    super.initState();
    formGroup = FormGroup({
      'UserName': FormControl<String>(validators: [Validators.required]),
      'Password': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    final form = ReactiveForm.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BasePage(
                selectedItems: [],
                namePage: 'sign',
              ),
            ),
          );
        } else if (state is LoginFailure) {
          Fluttertoast.showToast(
            msg: "Failed to log in",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xffDC3545),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const LoadingWidget();
        }
        return SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xffebebeb),
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
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
                                  formGroup: formGroup,
                                  // تعديل هنا لتمرير الحقل المطلوب
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username'.tr(),
                                        style: TextStyle(
                                            fontFamily: 'Recurisive',
                                            fontSize: 18),
                                      ),
                                      3.verticalSpace,
                                      CustomReactiveForm(
                                        formControlName: 'UserName',
                                        suffixIcon: Icon(
                                          Icons.drive_file_rename_outline,
                                          color: Colors.grey,
                                          size: 13.h,
                                        ),
                                        keyboardType: TextInputType.name,
                                        controller: usernameController, // ربط حقل اسم المستخدم
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        'Password'.tr(),
                                        style: TextStyle(
                                            fontFamily: 'Recurisive',
                                            fontSize: 18),
                                      ),
                                      5.verticalSpace,
                                      CustomReactiveForm(
                                        formControlName: 'Password',
                                        suffixIcon: Icon(
                                          Icons.visibility,
                                          color: Colors.grey,
                                          size: 16.h,
                                        ),
                                        keyboardType: TextInputType.text,
                                        controller: passwordController, // ربط حقل كلمة المرور
                                      ),
                                      5.verticalSpace,
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
                                                    BorderRadius.circular(
                                                        4.sp)),
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgetPassword()));
                                                // context
                                                //     .pushNamed(ForgetPassword.name),
                                              },
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

                                            final String userName = usernameController.text;
                                            final String password = passwordController.text;

                                            final auth = Auth(UserName: userName, Password: password);
                                            BlocProvider.of<AuthBloc>(context).add(LoginAuth(auth: auth));
                                            print("oo");
                                            if (form?.valid == true) {
                                              final UserName = (form?.value
                                                      as Map<String,
                                                          dynamic>)['UserName']
                                                  ?.toString();

                                              final Password = (form?.value
                                                      as Map<String,
                                                          dynamic>)['Password']
                                                  ?.toString();

                                              print("kk");
                                              if (UserName != null &&
                                                  Password != null) {
                                                bloc.add(LoginAuth(
                                                  auth: Auth(
                                                      UserName: UserName,
                                                      Password: Password),
                                                ));
                                              }
                                            }
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
        // else if (state is LoginSuccess) {
        //   user:state.user;
        //
        // } else if (state is LoginFailure) {
        //   return MessageDisplayWidget(message: state.message.toString());
        // }
        //
        // return const LoadingWidget();
      },
    );
  }
}
