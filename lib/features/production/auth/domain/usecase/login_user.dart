import 'package:dartz/dartz.dart';

import '../../../../../core/erroe/failure.dart';
import '../entities/auth.dart';
import '../repositiries/auth_repositories.dart';

class LoginUseCase{
  final AuthRepository repository;

  LoginUseCase({required this.repository});
  Future<Either<Failure,Unit>> call(Auth auth) async{
    return await repository.login(auth);
  }
}