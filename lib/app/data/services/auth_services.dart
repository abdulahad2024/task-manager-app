import 'package:flutter/foundation.dart'; // kDebugMode ব্যবহারের জন্য
import 'package:task_masenger_app/app/core/constants/api/api_endpoints.dart';
import 'package:task_masenger_app/app/core/network/network_service/network_service.dart';

class AuthServices {
  final NetworkService _networkService = NetworkService();

  // 1. SignUp API Call
  Future<dynamic> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> body = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address,
        "password": password,
      };

      if (kDebugMode) {
        print("📤 [AuthService] SignUp Request -> Endpoint: ${ApiEndpoints.signUp} | Body: $body");
      }

      final response = await _networkService.post(
        endpoint: ApiEndpoints.signUp,
        body: body,
      );

      if (kDebugMode) {
        print("📥 [AuthService] SignUp Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [AuthService] SignUp Error -> $e");
      }
      rethrow;
    }
  }

  // 2. Verify Email API Call
  Future<dynamic> verifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final Map<String, dynamic> body = {
        "email": email,
        "code": code,
      };

      if (kDebugMode) {
        print("📤 [AuthService] VerifyEmail Request -> Endpoint: ${ApiEndpoints.verifyEmail} | Body: $body");
      }

      final response = await _networkService.post(
        endpoint: ApiEndpoints.verifyEmail,
        body: body,
      );

      if (kDebugMode) {
        print("📥 [AuthService] VerifyEmail Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [AuthService] VerifyEmail Error -> $e");
      }
      rethrow;
    }
  }

  // 3. Login API Call
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };

      if (kDebugMode) {
        print("📤 [AuthService] Login Request -> Endpoint: ${ApiEndpoints.login} | Body: $email");
      }

      final response = await _networkService.post(
        endpoint: ApiEndpoints.login,
        body: body,
      );

      if (kDebugMode) {
        print("📥 [AuthService] Login Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [AuthService] Login Error -> $e");
      }
      rethrow;
    }
  }
}