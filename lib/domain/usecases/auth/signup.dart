import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/usecases/usecase.dart';
import 'package:flutter_application_2/data/models/auth/create_user_req.dart';
import 'package:flutter_application_2/domain/repository/auth/auth.dart';
import 'package:flutter_application_2/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
