import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/loading.dart';
import '../utils/snackbar.dart';

class ApiCommunication {
  late Dio _dio;
  final String _baseUrl = 'https://labapi.yuma-technology.co.uk:8443/delivery/';

  ApiCommunication({int? connectTimeout, int? receiveTimeout}) {
    _dio = Dio();
    _dio.options.connectTimeout =
        Duration(milliseconds: receiveTimeout ?? 60000); //1000 = 1s
    _dio.options.receiveTimeout =
        Duration(milliseconds: receiveTimeout ?? 60000);
  }

  void endConnection() => _dio.close(force: true);

  Future<Response?> doPostRequest({
    required Map<String, dynamic> requestData,
    String? endPoint,
    bool enableLoading = true,
    Map<String, dynamic>? header,
  }) async {
    Response? response;
    String url = '$_baseUrl${endPoint ?? ''}';
    Map<String, dynamic> apiHeader = header ??
        <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        };

    debugPrint('$url\n$requestData');

    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        if (enableLoading) loader();
        response = await _dio.post(
          url,
          data: requestData,
          options: Options(headers: apiHeader),
        );
        if (enableLoading) loaderDismiss();
      } on DioError catch (e) {
        if (enableLoading) loaderDismiss();
        debugPrint(e.toString());
        if (e.type == DioErrorType.connectionTimeout) {
          errorSnack('Connection timeout');
        } else if (e.type == DioErrorType.receiveTimeout) {
          errorSnack('Receive timeout');
        }
        if (e.response?.statusCode != null && e.response!.statusCode! > 200) {
          errorSnack('Status : ${e.message}');
        }
      } on SocketException catch (e) {
        if (enableLoading) loaderDismiss();
        debugPrint(e.message);
        errorSnack('Os Error : ${e.osError}');
      } catch (e) {
        if (enableLoading) loaderDismiss();
        debugPrint(e.toString());
        errorSnack('Status : ${e.toString()}');
      }
      if (response != null && response.statusCode == 200) {
        debugPrint(response.data.toString());
        return response;
      } else {
        errorSnack('${response?.statusCode}');
      }
    } else {
      alertSnack('Sorry, You are not connected with mobile/wifi network');
    }
    return null;
  }
}
