import 'package:dartz/dartz.dart';
import 'package:lavender4/core/erroe/eceptions.dart';
import 'package:lavender4/core/erroe/failure.dart';
import 'package:lavender4/features/production/auth/data/models/auth_model.dart';
import 'package:lavender4/features/production/auth/domain/entities/auth.dart';
import 'package:lavender4/features/production/auth/domain/repositiries/auth_repositories.dart';

import '../../../../../core/network/network_info.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> login(Auth auth) async {
    final AuthModel authModel = AuthModel(
        UserName: auth.UserName, PassWord: auth.Password);

    if (await networkInfo.isConnected) {
      try {
         await remoteDataSource.loginUser(authModel);
        return const Right(unit);
      } on WrongDataException {
        return Left(WrongDataFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }
}
