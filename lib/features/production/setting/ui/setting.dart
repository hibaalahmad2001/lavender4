import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lavender4/core/theme/extension.dart';
import '../../../../commen/global_widgets/app_image.dart';
import '../../../../commen/global_widgets/app_text.dart';
import '../../../../commen/theme/color_schemes.g.dart';
import '../../../../generated/assets.dart';
import '../../auth/presentation/ui/sign_in.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  static const String path = '/Setting';
  static const String name = 'Setting';

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return const Setting();
  }

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final TextEditingController _phoneController = TextEditingController(text: '0957465598');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              RSizedBox(
                height: 160.h,
                child: Stack(
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
                              top: 20.h,
                              left: 15.w,
                              child: AppText.displayMedium(
                                "Setting".tr(),
                                fontWeight: FontWeight.w400,
                                color: lightColorScheme.primary,
                                style: TextStyle(fontFamily: 'Recurisive'),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: lightColorScheme.primary,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.bodyMedium(
                            "My_Email".tr(),
                            style: TextStyle(
                                fontFamily: 'Recurisive', fontSize: 18),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          AppText.bodyMedium(
                            "hiba@gmail.com",
                            style: TextStyle(
                                fontFamily: 'Recurisive',
                                fontSize: 15,
                                color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 10.w,
                      endIndent: 10.w,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_android,
                        color: lightColorScheme.primary,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.bodyMedium(
                            "My_Phone".tr(),
                            style: TextStyle(
                                fontFamily: 'Recurisive', fontSize: 18),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          AppText.bodyMedium(
                            "0955854282",
                            style: TextStyle(
                                fontFamily: 'Recurisive',
                                fontSize: 15,
                                color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.grey.withOpacity(0.7),
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              title: Text(
                                'Update_your_number'.tr(),
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    // استخدام _phoneController الذي تم تعريفه مسبقاً
                                    controller: _phoneController,
                                    decoration: InputDecoration(
                                      labelText: 'Your_Number'.tr(),
                                      prefixIcon: Icon(Icons.phone_android),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please_enter_the_phone_number'.tr();
                                      }
                                      return null;
                                    },
                                    style: TextStyle(fontSize: 14),
                                    onChanged: (val) {
                                      // يتم تحديث الرقم هنا دون إعادة تعيينه إلى القيمة الأصلية
                                    },
                                  ),

                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white, // لون النص داخل الزر
                                    backgroundColor: Colors.redAccent, // لون خلفية الزر
                                  ),
                                  child: Text('Cancel'.tr()),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();


                                      // إغلاق النافذة المنبثقة
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green, // لون الزر
                                  ),
                                  child: Text('Update'.tr(), style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Divider(
                      indent: 10.w,
                      endIndent: 10.w,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: lightColorScheme.primary,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.bodyMedium(
                            "Language".tr(),
                            style: TextStyle(fontFamily: 'Recurisive', fontSize: 18),
                          ),
                          SizedBox(height: 5.h),
                          AppText.bodyMedium(
                            context.locale.languageCode == 'ar' ? 'العربية' : 'English',
                            style: TextStyle(
                                fontFamily: 'Recurisive',
                                fontSize: 15,
                                color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.grey.withOpacity(0.7),
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            String? selectedLanguage = context.locale.languageCode;
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              title: Text(
                                'Choose_Language'.tr(),
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: DropdownButtonFormField<String>(
                                value: selectedLanguage,
                                decoration: InputDecoration(
                                  labelText: 'Select_Language'.tr(),
                                  border: OutlineInputBorder(),
                                ),
                                items: <String>['ar', 'en']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value == 'ar' ? 'العربية' : 'English'),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  selectedLanguage = newValue;
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please_select_a_language'.tr();
                                  }
                                  return null;
                                },
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  child: Text('Cancel'.tr()),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    if (selectedLanguage != null) {
                                      context.setLocale(Locale(selectedLanguage!));
                                    }

                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  child: Text('Update'.tr(),
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Divider(
                      indent: 10.w,
                      endIndent: 10.w,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: lightColorScheme.primary,
                      ),
                      title: AppText.bodyMedium(
                        "Log_out".tr(),
                        style:
                            TextStyle(fontFamily: 'Recurisive', fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
