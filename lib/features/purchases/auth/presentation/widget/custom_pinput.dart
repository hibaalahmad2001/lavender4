
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../commen/theme/color_schemes.g.dart';


class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.pinController,
  });

  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      controller: pinController,
      keyboardType: TextInputType.number,
      defaultPinTheme: PinTheme(
          height: 46.h,
          width: 46.w,
          decoration: BoxDecoration(
              border: Border.all(color: lightColorScheme.primary,),
              color: lightColorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8.r))),
      focusedPinTheme: PinTheme(
          width: 46.w,
          height: 46.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: lightColorScheme.onPrimaryContainer,width: 1.3.w),
            color: lightColorScheme.primaryContainer,
          )),
    );
  }
}