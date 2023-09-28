// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:flutterfireabsetest/services/api/interceptor/dio_errors.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      // ignore: deprecated_member_use
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionError:
        throw TimeoutException(err.requestOptions);
      case DioErrorType.badCertificate:
        throw BadCertificateException(err.requestOptions);
      case DioErrorType.cancel:
        throw CancelException(err.requestOptions);
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}
