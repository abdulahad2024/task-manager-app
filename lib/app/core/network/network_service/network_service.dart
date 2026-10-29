import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart'; // kDebugMode ব্যবহার করার জন্য
import 'package:http/http.dart' as http;
import 'package:task_masenger_app/app/core/constants/api/api_endpoints.dart';

class NetworkService {
  // Singleton pattern
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  // Common Headers
  Map<String, String> _getHeaders({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Debug Log Print Helper
  void _printLog({required String url, required String method, dynamic body, required http.Response response}) {
    if (kDebugMode) {
      print("--------------------------------------------------bib");
      print("🌐 [API $method] -> URL: $url");
      if (body != null) print("📦 [Request Body] -> $body");
      print("📥 [Status Code] -> ${response.statusCode}");
      print("📄 [Response Body] -> ${response.body}");
      print("----------------------------------------------------");
    }
  }

  // 1. GET Method
  Future<dynamic> get({required String endpoint, String? token}) async {
    final url = '${ApiEndpoints.baseUrl}$endpoint';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: _getHeaders(token: token),
      );
      _printLog(url: url, method: 'GET', response: response);
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      if (kDebugMode) print("❌ [GET Error] -> $e");
      rethrow;
    }
  }

  // 2. POST Method
  Future<dynamic> post({required String endpoint, dynamic body, String? token}) async {
    final url = '${ApiEndpoints.baseUrl}$endpoint';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: _getHeaders(token: token),
        body: jsonEncode(body),
      );
      _printLog(url: url, method: 'POST', body: body, response: response);
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      if (kDebugMode) print("❌ [POST Error] -> $e");
      rethrow;
    }
  }

  // 3. PUT Method
  Future<dynamic> put({required String endpoint, dynamic body, String? token}) async {
    final url = '${ApiEndpoints.baseUrl}$endpoint';
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: _getHeaders(token: token),
        body: jsonEncode(body),
      );
      _printLog(url: url, method: 'PUT', body: body, response: response);
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      if (kDebugMode) print("❌ [PUT Error] -> $e");
      rethrow;
    }
  }

  // 4. PATCH Method
  Future<dynamic> patch({required String endpoint, dynamic body, String? token}) async {
    final url = '${ApiEndpoints.baseUrl}$endpoint';
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: _getHeaders(token: token),
        body: jsonEncode(body),
      );
      _printLog(url: url, method: 'PATCH', body: body, response: response);
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      if (kDebugMode) print("❌ [PATCH Error] -> $e");
      rethrow;
    }
  }

  // 5. DELETE Method
  Future<dynamic> delete({required String endpoint, dynamic body, String? token}) async {
    final url = '${ApiEndpoints.baseUrl}$endpoint';
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: _getHeaders(token: token),
        body: body != null ? jsonEncode(body) : null,
      );
      _printLog(url: url, method: 'DELETE', body: body, response: response);
      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      if (kDebugMode) print("❌ [DELETE Error] -> $e");
      rethrow;
    }
  }

  // 6. MULTIPART Method
  Future<dynamic> multipart({
    required String endpoint,
    required Map<String, String> fields,
    required File imageFile,
    required String imageFieldKey,
    String? token,
  }) async {
    final url = '${ApiEndpoints.baseUrl}$endpoint';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll({
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      });

      request.fields.addAll(fields);

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        imageFieldKey,
        stream,
        length,
        filename: imageFile.path.split('/').last,
      );
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (kDebugMode) {
        print("--------------------------------------------------");
        print("🌐 [API MULTIPART] -> URL: $url");
        print("📦 [Request Fields] -> $fields");
        print("🖼️ [Image Path] -> ${imageFile.path}");
        print("📥 [Status Code] -> ${response.statusCode}");
        print("📄 [Response Body] -> ${response.body}");
        print("--------------------------------------------------");
      }

      return _processResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (e) {
      if (kDebugMode) print("❌ [MULTIPART Error] -> $e");
      rethrow;
    }
  }

  // Response Handler & Error Catcher
  dynamic _processResponse(http.Response response) {
    try {
      final decodedBody = response.body.isNotEmpty ? jsonDecode(response.body) : null;

      switch (response.statusCode) {
        case 200:
        case 201:
          return decodedBody;
        case 400:
          throw Exception(decodedBody != null && decodedBody['message'] != null
              ? decodedBody['message']
              : 'Bad Request');
        case 401:
        case 403:
          throw Exception('Unauthorized! Please login again.');
        case 404:
          throw Exception('Not Found');
        case 500:
        default:
          throw Exception(decodedBody != null && decodedBody['message'] != null
              ? decodedBody['message']
              : 'Server Error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to parse response: ${response.body}');
    }
  }
}