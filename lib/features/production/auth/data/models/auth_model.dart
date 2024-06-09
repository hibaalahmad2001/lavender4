import 'package:lavender4/features/production/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  AuthModel(
      {required String UserName,
      required String PassWord,
      }) : super(UserName: UserName, Password: PassWord);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        UserName: json['UserName'],
        PassWord: json['PassWord'],
        );
  }

  Map<String, dynamic> toJson() {
    return {'UserName': UserName, 'PassWord': Password};
  }
}
