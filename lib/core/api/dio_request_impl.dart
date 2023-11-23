
import '../constants/constants.dart';
import '../constants/typedef.dart';

import 'api_request.dart';
import 'package:dio/dio.dart';
import 'https_failure.dart';

class DioRequestImpl implements ApiRequest {
  //final UserAuthStore userStore = injector<UserAuthStore>();

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      baseUrl: kBaseUrl,
    ),
  );
  
  @override
  Future<ApiResponse> delete({required String url, Map? data, Map<String, dynamic>? queryParameters}) async {
   try {
      final response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        data: data,
      );
    
      return response.data;
    } on DioException catch (error) {
      throw HttpsFailure.fromDioException(error);
    } on Exception catch (error) {
      throw HttpsFailure(
        code: 999,
        error: error.toString(),
        method: 'delete',
      );
    }
  }
  
  @override
  Future<ApiResponse> get({required String url, Map<String, dynamic>? queryParameters}) async {
   try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
     
      return response.data;
    } on DioException catch (error) {
     
      throw HttpsFailure.fromDioException(error);
    } on Exception catch (error) {
      throw HttpsFailure(
        code: 999,
        error: error.toString(),
        method: 'get',
      );
    }
  }
  
  @override
  Future getList({required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
     
      return response.data;
    } on DioException catch (error) {
      throw HttpsFailure.fromDioException(error);
    } on Exception catch (error) {
      throw HttpsFailure(
        code: 999,
        error: error.toString(),
       
        method: 'getList',
      );
    }
  }
  
  @override
  Future<ApiResponse> patch({required String url, Map? data, Map<String, dynamic>? queryParameters}) async {
   try {
      final response = await _dio.patch(
        url,
        queryParameters: queryParameters,
        data: data,
      );
  
      return response.data;
    } on DioException catch (error) {
      throw HttpsFailure.fromDioException(error);
    } on Exception catch (error) {
      throw HttpsFailure(
        code: 999,
        error: error.toString(),
        method: 'patch',
      );
    }
  }
  
  @override
  Future<ApiResponse> post({required String url, Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) async {
     try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: data,
      );
    
      if (response.statusCode == 201 || response.statusCode == 204) {
        return response.data;
      }
      return response.data;
    } on DioException catch (error) {
      throw HttpsFailure.fromDioException(error);
    } on Exception catch (error) {
      throw HttpsFailure(
        code: 999,
        error: error.toString(),
        method: 'post',
      );
    }
  
  }
  
  @override
  Future<ApiResponse> put({required String url, Map? data, Map<String, dynamic>? queryParameters}) async {
     try {
      final response = await _dio.put(
        url,
        queryParameters: queryParameters,
        data: data,
      );
  
      return response.data;
    } on DioException catch (error) {
      throw HttpsFailure.fromDioException(error);
    } on Exception catch (error) {
      throw HttpsFailure(
        code: 999,
        error: error.toString(),
        method: 'patch',
      );
    }
  }

 
}
