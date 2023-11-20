import '../constants/typedef.dart';

abstract interface class ApiRequest {
  Future<ApiResponse> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> getList({required String url, Map<String, dynamic>? queryParameters});

  Future<ApiResponse> delete({
    required String url,
    Map? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> patch({
    required String url,
    Map? data,
    Map<String, dynamic>? queryParameters,
  });
}
