// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lavender4/core/theme/extension.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// import '../../../../commen/global_widgets/app_image.dart';
// import '../../../../commen/global_widgets/app_text.dart';
// import '../../../../generated/assets.dart';
// import '../../../commen/theme/color_schemes.g.dart';
// import '../../../features/home/presentation/ui/base_page.dart';
// import '../../../features/order/new_orders/presentation/ui/home_page.dart';
// import '../../presentation/bloc/auth_bloc.dart';
// import '../../presentation/widget/custom_reactive_textfield.dart';
//
// class ResetPassword extends StatelessWidget {
//   const ResetPassword({super.key});
//
//   static const String path = 'ResetPassword';
//   static const String name = "ResetPassword";
//
//   static Widget pageBuilder(BuildContext context, GoRouterState state) {
//     return ResetPassword();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: const Color(0xffebebeb),
//           body: Stack(
//             children: [
//               Positioned(
//                 top: 0,
//                 child: Stack(
//                   children: [
//                     AppImage.asset(
//                       Assets.iconsVector6,
//                     ),
//                     Positioned(
//                         top: 30.h,
//                         left: 10.w,
//                         child: AppText.headlineSmall(
//                           "Reset_Password".tr(),
//                           fontWeight: FontWeight.w400,
//                           color: lightColorScheme.primary,
//                           style: TextStyle(fontFamily: 'Recurisive'),
//                         ))
//                   ],
//                 ),
//               ),
//               PositionedDirectional(
//                 start: 30.h,
//                 end: 30.h,
//                 top: 200,
//                 child: ReactiveForm(
//                   formGroup: context.read<AuthBloc>().resetPassword,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       AppText.headlineMedium(
//                         "Enter_New_Password".tr(),
//                         style: TextStyle(fontFamily: 'Recurisive'),
//                       ),
//                       10.verticalSpace,
//                       AppText.bodyMedium(
//                         textAlign: TextAlign.center,
//                         "Your_new_password_must_be_different_from_previously_used_password".tr(),
//                         style: TextStyle(fontFamily: 'Recurisive'),
//                       ),
//                       30.verticalSpace,
//                        CustomReactiveForm(
//                           formControlName: 'password',
//                           keyboardType: TextInputType.visiblePassword,
//                           hintText: 'password'.tr()),
//                       15.verticalSpace,
//                        CustomReactiveForm(
//                           formControlName: 'confirmPassword',
//                           keyboardType: TextInputType.visiblePassword,
//                           hintText: 'Confirm_password'.tr()),
//                       10.verticalSpace,
//                       20.verticalSpace,
//                       ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=> BasePage(namePage: 'namePage', selectedItems: [])));
//
//                           },
//                           style: ElevatedButton.styleFrom(
//                               elevation: 0,
//                               backgroundColor: lightColorScheme.primary,
//                               fixedSize: Size(280.w, 30.h),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.r))),
//                           child: AppText.bodyMedium(
//                             "Continue".tr(),
//                             color: Colors.white,
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: Stack(
//                   children: [
//                     AppImage.asset(
//                       Assets.iconsVector3,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
