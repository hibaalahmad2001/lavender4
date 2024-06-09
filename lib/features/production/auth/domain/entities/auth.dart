import 'package:equatable/equatable.dart';

class Auth extends Equatable{
  final String UserName;
  final String Password;

  Auth({required this.UserName, required this.Password,});

  @override
  List<Object?> get props => [UserName, Password];

}