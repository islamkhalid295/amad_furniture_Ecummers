import 'dart:io';

import 'package:cedage/core/api/end_points.dart';
import 'package:cedage/core/api/status_code.dart';
import 'package:dio/dio.dart';

import '../exceptions/server/server_exception.dart';
import 'api_consummer.dart';


class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {

    client.options.baseUrl = EndPoints.BASE_URL;

    client.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

  }

  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters,dynamic body,Map<String, dynamic>? headers}) async {

      final Response response =
      await client.delete(path, queryParameters: queryParameters,data: body,options:Options(headers: headers) );
      return response.data;

  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
      final Response response =
      await client.get(path, queryParameters: queryParameters,options:Options(headers: headers));
      return response.data;
  }

  @override
  Future patch(String path,
      {Map<String, dynamic>? queryParameters, body,Map<String, dynamic>? headers}) async {
    final Response response =
    await client.patch(path, queryParameters: queryParameters, data: body,options:Options(headers: headers));
    return response.data;
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters, body,Map<String, dynamic>? headers}) async {

      final Response response =
      await client.post(path, queryParameters: queryParameters, data: body,options:Options(headers: headers));
      return response.data;

  }

  @override
  Future put(String path, {Map<String, dynamic>? queryParameters, body,Map<String, dynamic>? headers}) async {
    final Response response =
    await client.put(path, queryParameters: queryParameters, data: body,options:Options(headers: headers));
    return response.data;
  }

  @override
  Future<void> setToken() async {
    // try {
    //   final token = await TokensSecureStorage().getAccessToken();
    //   client.options.headers.addAll({"Authorization": "Bearer $token"});
    // } catch (e) {
    //   throw const ReadFromDeviceException();
    // }
    throw UnimplementedError();
  }

  void removeToken() {
    client.options.headers.remove("Authorization");
  }

  void _errorHandler(DioException e) {
    if (e.error is SocketException) {
      throw const NoInternetConnectionException("No internet connection");
    } else if (e.response?.statusCode == StatusCode.unauthorized) {
      throw const UnauthorizedException("Unauthorized action");
    } else if (e.response?.statusCode == StatusCode.badRequest) {
      final message = _extractErrorMsgFromResponse(e.response!);
      throw BadRequestException(message);
    } else if (e.response?.statusCode == StatusCode.notFound) {
      throw const NotFoundException();
    } else {
      throw const ServerException("Server is not responding");
    }
  }

  String _extractErrorMsgFromResponse(Response response) {
    // Extract the errors from the response
    // final errors = response.data['errors'];
    // final error = errors[0];
    // final errorMsg = error['msg'];
    // throw ServerException(errorMsg);
    return "Bad Request";
  }
}
