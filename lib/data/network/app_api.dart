import 'package:dio/dio.dart';
import 'package:first_application/app/constants.dart';
import 'package:retrofit/http.dart';
import 'package:first_application/data/responses/responses.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient{
  factory AppServicesClient(Dio dio,{String baseUrl})=_AppServicesClient;
  @POST("/customer/login")
  Future<AuthenticationResponse> login(
      @Field('email') String gmail,
      @Field("password") String password
      );
}