import 'package:flutter/foundation.dart'; // kDebugMode ব্যবহারের জন্য
import 'package:task_masenger_app/app/core/constants/api/api_endpoints.dart';
import 'package:task_masenger_app/app/core/network/network_service/network_service.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';

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




  final LocalAuthStorage _storage = LocalAuthStorage();

  // 4. Change Password API Call
  // Change Password API Call (Flutter)
  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final token = _storage.getAccessToken(); // লোকাল স্টোরেজ থেকে টোকেন নেওয়া

      final Map<String, dynamic> body = {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      };

      if (kDebugMode) {
        print("📤 [AuthService] ChangePassword Request -> Endpoint: ${ApiEndpoints.changePassword} | Body: $body");
      }

      // 🌟 ব্যাকএন্ডে patch রাউট হওয়ার কারণে এখানে .patch ব্যবহার করতে হবে
      final response = await _networkService.patch(
        endpoint: ApiEndpoints.changePassword,
        body: body,
        token: token, // প্রোটেক্টেড রাউট হওয়ায় টোকেন পাঠানো হচ্ছে
      );

      if (kDebugMode) {
        print("📥 [AuthService] ChangePassword Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [AuthService] ChangePassword Error -> $e");
      }
      rethrow;
    }
  }


  // AuthServices ক্লাসের ভেতরে নিচের মেথডটি যুক্ত করুন:

  // 5. Delete Account API Call
// 5. Delete Account API Call
  Future<void> deleteAccount() async {
    try {
      // 🌟 ১. লোকাল স্টোরেজ থেকে টোকেন সংগ্রহ করা
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [AuthService] DeleteAccount Request -> Endpoint: ${ApiEndpoints.deleteAccount}");
      }

      // 🌟 ২. NetworkService-এ delete রিকোয়েস্টের সাথে token পাস করা হলো
      final response = await _networkService.delete(
        endpoint: ApiEndpoints.deleteAccount,
        token: token, // প্রোটেক্টেড রাউট হওয়ায় টোকেন পাঠানো জরুরি
      );

      if (kDebugMode) {
        print("📥 [AuthService] DeleteAccount Response -> $response");
      }

      if (response == null || response['success'] != true) {
        throw Exception(response?['message'] ?? 'Failed to delete account');
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ [AuthService] DeleteAccount Error -> $e");
      }
      throw Exception(e.toString().replaceAll("Exception: ", ""));
    }
  }

}