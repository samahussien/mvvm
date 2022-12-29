import 'package:dio/dio.dart';
import 'package:first_application/data/network/failure.dart';
class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError)
      //dio error so it's an error from response or the api or From dio itself
      failure = _handleError(error);
     else
      //default error
      failure = DataSource.DEFAULT.getFailure();

  }
}
Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioErrorType.receiveTimeout:
      return  DataSource.RECEIVE_TIMEOUT.getFailure();

    case DioErrorType.response:
      if(error.response!=null&& error.response?.statusCode!=null&& error.response?.statusMessage!=null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? '');
      }
      else{
        return DataSource.DEFAULT.getFailure();
      }

    case DioErrorType.cancel:
      return  DataSource.CANCEL.getFailure();

    case DioErrorType.other:
      return  DataSource.DEFAULT.getFailure();

  }
}


extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      case DataSource.CASH_ERROR:
        return Failure(ResponseCode.CASH_ERROR, ResponseMessage.CASH_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CASH_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  //LOCAL STATUS CODE
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASH_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = "success";
  static const String NO_CONTENT = "no content";
  static const String BAD_REQUEST = "bad request try again later ";
  static const String UNAUTHORISED = "user is unauthorized try again later";
  static const String FORBIDDEN = "forbidden request";
  static const String NOT_FOUND = 'something went wrong try again later';
  static const String INTERNAL_SERVER_ERROR =
      "something went wrong try again later";

  //LOCAL STATUS CODE
  static const String CONNECT_TIMEOUT = "timeout error try again later";
  static const String CANCEL = "request wast canceled try again later";
  static const String RECEIVE_TIMEOUT = "time out error try again later";
  static const String SEND_TIMEOUT = "something went wrong try again later";
  static const String CASH_ERROR = "cache error try again later";
  static const String NO_INTERNET_CONNECTION =
      "please check out your internet connection ";
  static const String DEFAULT = "something went wrong try again later";
}
class ApiInternalStatus{
  static const int Success=0;
  static const int failure=1;
}
