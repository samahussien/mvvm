//dio factory
import 'package:dio/dio.dart';
import 'package:first_application/app/app_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language=await _appPreferences.getAppLanguage();
    int timeOut = Constants.apiTimeOut; //minute

    Map<String, String> headers = {
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language, //todo get lang rom app prefs
    };
    dio.options = BaseOptions(
      contentType: APPLICATION_JSON,
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: timeOut,
    );
    if(!kReleaseMode){
      //to know in debug mode or release mode
      dio.interceptors.add(PrettyDioLogger(requestHeader:true,requestBody: true,responseHeader: true));
    }
    return dio;
  }
}