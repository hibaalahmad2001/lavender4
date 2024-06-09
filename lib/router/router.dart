//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lavender4/features/basket/basket.dart';
// import 'package:lavender4/features/employee/emoloyee.dart';
// import 'package:lavender4/features/order/new_orders/presentation/ui/new_order.dart';
// import 'package:lavender4/features/setting/ui/setting_page.dart';
//
// import '../auth/presentation/ui/email_verification.dart';
// import '../auth/presentation/ui/forget_password.dart';
// import '../auth/presentation/ui/reset_password.dart';
// import '../auth/presentation/ui/sign_in.dart';
// import '../auth/presentation/ui/sign_up.dart';
// import '../features/home/presentation/ui/base_page.dart';
// import '../features/order/new_orders/presentation/ui/home_page.dart';
//
//
// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey =
// GlobalKey<NavigatorState>();
//
// final router = GoRouter(
//     navigatorKey: _rootNavigatorKey, routes:
// [
//   GoRoute(
//       path: SignIn.path,
//       name: SignIn.name,
//       builder: SignIn.pageBuilder,
//       routes: [
//         GoRoute(
//             path: ForgetPassword.path,
//             name: ForgetPassword.name,
//             builder: ForgetPassword.pageBuilder,
//             routes: [
//               GoRoute(
//                   path: EmailVerification.path,
//                   name: EmailVerification.name,
//                   builder: EmailVerification.pageBuilder,
//                   routes: [
//                     GoRoute(
//                       path: ResetPassword.path,
//                       name: ResetPassword.name,
//                       builder: ResetPassword.pageBuilder,
//                     ),
//                   ])
//             ]),
//         GoRoute(
//           path: SignUp.path,
//           name: SignUp.name,
//           builder: SignUp.pageBuilder,
//         )
//       ]),
//
//   // ShellRoute(
//   //     navigatorKey: _shellNavigatorKey,
//   //     builder: (context, state, child) {
//   //       return BasePage(child: child);
//   //     },
//   //     routes: [
//   //       GoRoute(
//   //           parentNavigatorKey: _shellNavigatorKey,
//   //           path: HomePage.path,
//   //           name: HomePage.name,
//   //           builder: HomePage.pageBuilder,
//   //           routes: [
//   //             GoRoute(
//   //                 path: NewOrder.path,
//   //                 name: NewOrder.name,
//   //                 builder: NewOrder.pageBuilder
//   //             ),
//   //             GoRoute(
//   //                 path: UnderwaryOrder.path,
//   //                 name: UnderwaryOrder.name,
//   //                 builder: UnderwaryOrder.pageBuilder
//   //             ),
//   //             GoRoute(
//   //                 path: FinishedOrder.path,
//   //                 name: FinishedOrder.name,
//   //                 builder: FinishedOrder.pageBuilder
//   //             ),
//   //
//   //           ]),
//   //       GoRoute(
//   //         parentNavigatorKey: _shellNavigatorKey,
//   //         path: Basket.path,
//   //         name: Basket.name,
//   //         builder: Basket.pageBuilder,
//   //       ),
//   //       GoRoute(
//   //         parentNavigatorKey: _shellNavigatorKey,
//   //         path: Employee.path,
//   //         name: Employee.name,
//   //         builder: Employee.pageBuilder,
//   //       ),
//   //       GoRoute(
//   //         parentNavigatorKey: _shellNavigatorKey,
//   //         path: SettingPage.path,
//   //         name: SettingPage.name,
//   //         builder: SettingPage.pageBuilder,
//   //       )
//   //     ]),
// ]);
