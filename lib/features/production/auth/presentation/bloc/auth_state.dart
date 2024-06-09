part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final Auth user;

  LoginSuccess({required this.user});
}

class MessageLoginUserState extends AuthState {
  final String message;

  MessageLoginUserState({required this.message});

  List<Object> get props => [message];
}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String? message;

  LoginFailure({required this.message});
}

// class GetUserSuccess extends AuthState {
//   final Auth user;
//
//   GetUserSuccess({required this.user});
// }
//
// class GetUserLoading extends AuthState {}


// class GetUserFailure extends AuthState {
//   final String? error;
//
//   GetUserFailure(this.error);
// }
// class DeleteUserLoading extends AuthState {}
// class DeleteUserSuccess extends AuthState {
//   final Auth user;
//
//   DeleteUserSuccess({required this.user});
// }
// class DeleteUserFailure extends AuthState {
//   final String? error;
//
//   DeleteUserFailure(this.error);
// }
//
// class CheckBox extends AuthState{
//
// }