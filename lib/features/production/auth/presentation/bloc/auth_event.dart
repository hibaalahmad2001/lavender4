part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginAuth extends AuthEvent {
  final Auth auth;
  LoginAuth({required this.auth});
}

// class GetUser extends AuthEvent {}
//
// class DeleteUser extends AuthEvent {}

// class ChangeCheckBox extends AuthEvent {
//   final bool isChecked;
//
//   ChangeCheckBox({required this.isChecked});
// }
