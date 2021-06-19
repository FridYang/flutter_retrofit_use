import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'BaseError.dart';
import 'header_interceptor.dart';

class BaseDio {
  BaseDio._(); // 把构造方法私有化

  static BaseDio _instance;

  static BaseDio getInstance() {  // 通过 getInstance 获取实例
    _instance ??= BaseDio._();

    return _instance;
  }

  Dio getDio() {
    final Dio dio = Dio();
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000); // 设置超时时间等 ...
    dio.interceptors.add(HeaderInterceptor()); // 添加拦截器，如 token之类，需要全局使用的参数
    dio.interceptors.add(PrettyDioLogger(  // 添加日志格式化工具类
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio;
  }

  BaseError getDioError(Object obj) {  // 这里封装了一个 BaseError 类，会根据后端返回的code返回不同的错误类
    switch (obj.runtimeType) {
      case DioError:
        if ((obj as DioError).type == DioErrorType.RESPONSE) {
          final response = (obj as DioError).response;
          if (response.statusCode == 401) {
            return NeedLogin();
          } else if (response.statusCode == 403) {
            return NeedAuth();
          } else if (response.statusCode == 408) {
            return UserNotExist();
          } else if (response.statusCode == 409) {
            return PwdNotMatch();
          } else if (response.statusCode == 405) {
            return UserNameEmpty();
          } else if (response.statusCode == 406) {
            return PwdEmpty();
          } else {
            return OtherError(
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
            );
          }
        }
    }
    return OtherError();
  }
}
