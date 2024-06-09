import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late final SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setToken(String token) async =>
      await _sharedPreferences.setString('token', token);

  static Future<bool> setId(int id) async=>
    await _sharedPreferences.setInt('id', id);


  static String? getToken() => _sharedPreferences.getString('token');
  static int? getId() => _sharedPreferences.getInt('id');




  static Future<bool> clearUser()async {
   return await _sharedPreferences.remove('token');}

   static Future<bool> setIsChecked(bool isChecked) async =>
   await _sharedPreferences.setBool('isChecked', isChecked);

  static bool? getIsChecked()=> _sharedPreferences.getBool("isChecked");



}
