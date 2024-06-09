import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavender4/features/purchases/auth/presentation/ui/sign_in.dart';

import '../../../../../commen/global_widgets/app_image.dart';
import '../../../../../commen/global_widgets/app_text.dart';
import '../../../../../commen/theme/color_schemes.g.dart';
import '../../../../../generated/assets.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key});

  static const String path = '/Setting';
  static const String name = 'Setting';

  static Widget pageBuilder(BuildContext context, GoRouterState state) {
    return const Setting();
  }

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final TextEditingController _phoneController =
  TextEditingController(text: '0957465598');
  final TextEditingController _addressController =
  TextEditingController(text: '123 Street, City');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? _image;
  bool _isUploading = false;
  // String? profileImagePath;

  Future<void> _pickImage() async {
    setState(() {
      _isUploading = true;
    });
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              RSizedBox(
                height: 160,
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
              SizedBox(height: 20,),
              ListTile(
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundImage: _image == null
                      ? AssetImage('assets/images/profile.png')
                      : Image.file(File(_image!.path)).image,
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
                          'Change_Profile_Image'.tr(),
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: _image == null
                                  ? AssetImage('assets/images/profile.png')
                                  : Image.file(File(_image!.path)).image,
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _pickImage,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                              ),
                              child: Text('Select_Image'.tr(),
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
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
                              // قم بتحديث الصورة الشخصية هنا
                              Navigator.of(context).pop();
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
                            height: 5,
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
                            height: 5,
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
                        Icons.location_on,
                        color: lightColorScheme.primary,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.bodyMedium(
                            "My_Address".tr(),
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          AppText.bodyMedium(
                            "123 Street, City",
                            style: TextStyle(
                              fontFamily: 'Recurisive',
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.grey.withOpacity(0.7),
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            String? address = "123 Street, City"; // Initialize with the current address
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              title: Text(
                                'Update_your_address'.tr(),
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
                                    keyboardType: TextInputType.text,
                                    controller: _addressController,
                                    decoration: InputDecoration(
                                      labelText: 'Your_Address'.tr(),
                                      prefixIcon: Icon(Icons.location_on),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please_enter_the_address'.tr();
                                      }
                                      return null;
                                    },
                                    style: TextStyle(fontSize: 14),
                                    onChanged: (val) {
                                      address = val; // Update the address here without resetting it to the original value
                                    },
                                  ),
                                ),
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
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      // Update the address with the new value
                                      address = _addressController.text;

                                      // Close the dialog
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
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
                          SizedBox(height: 5),
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
