import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lavender4/core/strings/messages.dart';
import 'package:lavender4/features/production/auth/domain/usecase/login_user.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../commen/service/storage_service.dart';
import '../../../../../core/erroe/failure.dart';
import '../../../../../core/strings/failures.dart';
import '../../domain/entities/auth.dart';
import '../../domain/repositiries/auth_repositories.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final AuthFacade authFaced;
//  bool isChecked = false;
  final LoginUseCase loginUser;

  AuthBloc({required this.loginUser}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginAuth) {
        emit(LoginLoading());
        final failureOrDoneLogin = await loginUser(event.auth);
        failureOrDoneLogin.fold(
              (failure) {
            emit(LoginFailure(message: _mapFailureToMessage(failure)));
          },
              (_) {
            emit(MessageLoginUserState(message: LOGIN_SUCCESS_MESSAGE));
          },
        );
      }
      // else if (event is GetUser) {
      // } else if (event is DeleteUser) {}
    });
  }

// AuthBloc() : super(AuthInitial()) {
//   on<LoginAuth>(loginEvent);
//   on<GetUser>(getUserEvent);
//   on<DeleteUser>(deleteUserEvent);
//   // on<ChangeCheckBox>(ChangeIsCheckedEvent);
// }

// void ChangeIsCheckedEvent(ChangeCheckBox event, Emitter emit) {
//   isChecked = event.isChecked;
//   StorageService.setIsChecked(isChecked);
//   emit(CheckBox());
// }

// Future loginEvent(LoginAuth event, Emitter emit) async {
//   if (login.valid) {
//     emit(LoginLoading());
//     final result = await authFaced.login(data: login.rawValue).then((value) {
//       emit(LoginSuccess(user: value));
//       print(state.toString());
//     }).catchError((error) {
//       emit(LoginFailure("Failed to log in"));
//       print(error.toString());
//     });
//   } else
//     login.markAllAsTouched();
// }
//
//
// Future getUserEvent(GetUser event, Emitter emit) async {
//   emit(GetUserLoading());
//   await authFaced.GetUser(id: StorageService.getId()!).then((value) {
//     emit(GetUserSuccess(user: value));
//     print(state.toString());
//   }).catchError((error) {
//     emit(GetUserFailure(error.toString()));
//     print(error.toString());
//   });
// }
// Future deleteUserEvent(DeleteUser event, Emitter emit) async {
//   emit(DeleteUserLoading());
//   await authFaced.deleteUser(id: StorageService.getId()!).then((value) {
//     emit(DeleteUserSuccess(user: value));
//     print(state.toString());
//   }).catchError((error) {
//     emit(DeleteUserFailure(error.toString()));
//     print(error.toString());
//   });
// }

// final login = FormGroup({
//   'password': FormControl<String>(
//     validators: [Validators.minLength(7), Validators.required],
//     value: "9uQFF1Lh",
//   ),
//   'username':
//       FormControl<String>(validators: [Validators.required], value: "atuny0")
// });

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OffLineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case WrongDataFailure:
        return WRONG_DATA_FAILURE_MESSAGE;
      case WrongUsernameFailure:
        return WRONG_DATA_FAILURE_MESSAGE;
      case WrongUsernameFailure:
        return WRONG_PASSWORD_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
