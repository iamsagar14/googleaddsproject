// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 🌎 Project imports:
import 'package:flutterfireabsetest/services/api/endpoint.dart';
import 'package:flutterfireabsetest/services/api/interceptor/error_interceptor.dart';

class BaseClient {
  late final Dio _dio = _createDio();

  Dio get dio => _dio;
  Dio _createDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: Endpoint.baseUrl,
      contentType: 'application/json',
      responseType: ResponseType.plain,
    );
    dio.interceptors.addAll(
      [
        ErrorInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        )
      ],
    );
    return dio;
  }
}
