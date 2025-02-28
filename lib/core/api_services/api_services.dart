// ignore_for_file: unused_import
import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> restRequest({
    required String url,
    String method = HttpMethods.get,
    Map<String, dynamic>? headers,
    dynamic body, // Bisa menerima Map atau FormData
    Map<String, dynamic>? queryParameters,
    bool useAuth = false,
    bool useTestApiKey = false, // Parameter baru untuk menentukan API key unit test atau produksi.
    bool isFormData = false,
  }) async {
    final headersDefault = headers ?? {}
      ..addAll({
        'accept': 'application/json',
      });

    // Jika bukan FormData, set content-type JSON.
    if (!isFormData) {
      headersDefault['content-type'] = 'application/json';
    }

    // if (useAuth) {
    //   final String? apiKey = useTestApiKey
    //       ? "8|xDZNP8eFC9Zcfw8b4gpdAbBvC01QtHyExkO0Qhsp" // Ganti dengan API key untuk unit test.
    //       : await sharedPreferencesUtils.getToken(); // Mengambil token dari shared preferences untuk produksi.
    //   PrintLog.printLog('Using API key: $apiKey');
    //   headersDefault['Authorization'] = 'Bearer $apiKey';
    // }

    try {
      Response response = await _dio.request(
        url,
        options: Options(method: method, headers: headersDefault),
        data: body,
        queryParameters: queryParameters,
      );

      return {
        'statusCode': response.statusCode,
        'statusMessage': response.statusMessage,
        'data': response.data,
      };
    } on DioException catch (e) {
      return {
        'statusCode': e.response?.statusCode,
        'statusMessage': e.response?.statusMessage ?? e.message,
        'error': e.message,
      };
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
