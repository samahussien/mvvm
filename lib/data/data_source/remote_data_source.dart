
import 'package:first_application/data/network/app_api.dart';
import"package:first_application/data/network/requests.dart";
import"package:first_application/data/responses/responses.dart";
abstract class RemoteDataSource{
  Future <AuthenticationResponse> login(LoginRequest loginRequest);
}
class RemoteDataSourceImp implements RemoteDataSource{
  final AppServicesClient _appServicesClient;
  RemoteDataSourceImp(this._appServicesClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServicesClient.login(loginRequest.email, loginRequest.password);
  }

}