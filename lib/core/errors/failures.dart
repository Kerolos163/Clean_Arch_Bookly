import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class FailuresServer extends Failures {
  FailuresServer(super.errMessage);
  factory FailuresServer.fromDioExceptio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return FailuresServer("Connection TimeOut with ApiServer");
      case DioExceptionType.sendTimeout:
        return FailuresServer("Send TimeOut with ApiServer");
      case DioExceptionType.receiveTimeout:
        return FailuresServer("Receive TimeOut with ApiServer");
      case DioExceptionType.badCertificate:
        return FailuresServer("Bad Certificate TimeOut with ApiServer");
      case DioExceptionType.badResponse:
        return FailuresServer.fromResponse(
          dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return FailuresServer("Request to APIServer Was Canceled");
      case DioExceptionType.connectionError:
        return FailuresServer("No Internet Connection");
      case DioExceptionType.unknown:
        return FailuresServer("unexpecyed Error,please try again");
      default:
        return FailuresServer("Opps There was an Error, Please Try Again");
    }
  }
  factory FailuresServer.fromResponse(int? statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return FailuresServer(response['error']['message']);
    } else if (statuscode == 404) {
      return FailuresServer("Your Response Not Found ,Please Try Again");
    } else if (statuscode == 500) {
      return FailuresServer("Internal Server Error ,Please Try Again");
    } else {
      return FailuresServer("Opps There was an Error, Please Try Again");
    }
  }
}
