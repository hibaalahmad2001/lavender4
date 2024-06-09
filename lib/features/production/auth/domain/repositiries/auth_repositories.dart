import 'package:lavender4/core/erroe/failure.dart';
import 'package:lavender4/features/production/auth/domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either<Failure,Unit>> login(Auth auth);
}