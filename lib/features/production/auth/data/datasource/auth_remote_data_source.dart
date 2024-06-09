import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/erroe/eceptions.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> loginUser(AuthModel authModel);
}

const BASE_URL = 'https://lavenderaya-001-site1.jtempurl.com/api/User/Login';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> loginUser(AuthModel authModel) async {
    final queryParams = {
      'UserName': authModel.UserName,
      'Password': authModel.Password,
    };

    // إنشاء الـ URL مع البارامترات
    final uri = Uri.parse(BASE_URL).replace(queryParameters: queryParams);

    try {
      final response = await client.post(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      // تحقق من الاستجابة
      if (response.statusCode == 200){
        final body = json.decode(response.body);
        if (body['isSuccess']) {
          // تخزين الـ token والـ refreshToken كما تريد
          // مثلاً في مينجمنت الحالة أو الذاكرة التخزينية للتطبيق
          final token = body['value']['token'];
          final refreshToken = body['value']['refreshToken'];
          // أجرِ العمليات المطلوبة مع الـ token والـ refreshToken

          return unit;
        } else {
          throw Exception(body['error']['message']);
        }
      } else {
        // ستحتاج هنا إلى معالجة المزيد من حالات الاستجابة وتفاصيل الأخطاء
        throw HttpException('Failed to login with status code: ${response.statusCode}');
      }
    } on Exception {
      // ستحتاج إلى تعامل مع الاستثناءات الأخرى التي قد تحدث، مثل مشاكل الشبكة
      throw OfflineException();
    }
  }
}