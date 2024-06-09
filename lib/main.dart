import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender4/router/router.dart';
import 'package:lavender4/service/notification_service/language_service.dart';

import 'features/production/auth/presentation/bloc/auth_bloc.dart';
import 'features/production/auth/presentation/ui/sign_in.dart';
import 'features/production/home/presentation/ui/base_page.dart';
import 'features/production/home/presentation/ui/logo_page.dart';
import 'injection_container.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => di.sl<AuthBloc>()),
      // BlocProvider(
      //   create: (context) => CartBloc(),
      // )

    ],
    //    child: const MyApp(),
    child: EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/languages', // مسار ملفات الترجمة
      fallbackLocale: Locale('ar'),
      child: const MyApp(),
    ),
  ));

//  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
//    context.setLocale(Locale('ar'));
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.of(context).size.width, // للعرض
          MediaQuery.of(context).size.height // للارتفاع

      ), // الحجم الذي صممت عليه واجهة التطبيق
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Recursive', // تعيين الخط الأساسي للتطبيق
            // يمكنك إضافة المزيد من الخصائص هنا
          ),
          debugShowCheckedModeBanner: false,
          home: SignIn(),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          //BasePage(namePage: 'main',selectedItems: []),
          builder: (context, child) {
            LanguageService(context);
            return child!;
          },
        );
      },
    );
  }
}
// return ScreenUtilInit(
//   designSize: const Size(360, 690),
//   minTextAdapt: true,
//   splitScreenMode: true,
//   builder: (_, child) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LogoPage(),
//     );
//   },
// );

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lavender4/features/home/presentation/ui/base_page.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // تهيئة FlutterScreenUtil
//     return ScreenUtilInit(
//       designSize: Size(360, 690), // الحجم الذي صممت عليه واجهة التطبيق
//       builder: () => MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: BasePage(),
//       ),
//     );
//   }
// }
