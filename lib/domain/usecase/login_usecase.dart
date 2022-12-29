import 'package:dartz/dartz.dart';
import 'package:first_application/data/network/failure.dart';
import 'package:first_application/data/network/requests.dart';
import 'package:first_application/domain/models.dart';
import 'package:first_application/domain/repository/repository.dart';
import 'package:first_application/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Authentication>{
 final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
    return  await _repository.login(LoginRequest(input.email,input.password));
  }

}
class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput(this.email,this.password);
}
