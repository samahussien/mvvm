
import 'package:first_application/data/network/failure.dart';
import 'package:first_application/domain/models.dart';
import 'package:dartz/dartz.dart';
import 'package:first_application/data/network/requests.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}