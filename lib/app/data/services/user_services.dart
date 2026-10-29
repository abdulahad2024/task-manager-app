import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:task_masenger_app/app/core/constants/api/api_endpoints.dart';
import 'package:task_masenger_app/app/core/network/network_service/network_service.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';

class UserServices {
  final NetworkService _networkService = NetworkService();
  final LocalAuthStorage _storage = LocalAuthStorage();

  // ১. ইউজারের প্রোফাইল ফেচ (GET) করা
  Future<dynamic> getProfile() async {
    try {
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [UserServices] Fetching User Profile... Endpoint: ${ApiEndpoints.profile}");
      }

      final response = await _networkService.get(
        endpoint: ApiEndpoints.profile,
        token: token,
      );

      if (kDebugMode) {
        print("📥 [UserServices] Profile Fetched Successfully -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [UserServices] Get Profile Error -> $e");
      }
      rethrow;
    }
  }

  // ২. ইউজারের প্রোফাইল আপডেট (PATCH - নাম, এড্রেস ইত্যাদি) করা
  Future<dynamic> updateProfile({
    required Map<String, dynamic> updateData,
  }) async {
    try {
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [UserServices] Updating Profile... Endpoint: ${ApiEndpoints.editProfile} Data: $updateData");
      }

      final response = await _networkService.patch(
        endpoint: ApiEndpoints.editProfile, // এখানে সঠিক এডিট রুট ব্যবহার হচ্ছে
        body: updateData,
        token: token,
      );

      if (kDebugMode) {
        print("📥 [UserServices] Profile Updated Successfully -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [UserServices] Update Profile Error -> $e");
      }
      rethrow;
    }
  }

  // ৩. প্রোফাইল পিকচারসহ ছবি আপলোড (Multipart) করা
  Future<dynamic> updateProfilePicture({
    required File imageFile,
    required String imageFieldKey,
    Map<String, String>? additionalFields,
  }) async {
    try {
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [UserServices] Uploading Profile Picture... Endpoint: ${ApiEndpoints.editProfile} Path: ${imageFile.path}");
      }

      final response = await _networkService.multipart(
        endpoint: ApiEndpoints.editProfile, // ব্যাকএন্ডের সঠিক আপডেট/আপলোড রুট এখানে নিশ্চিত করুন
        fields: additionalFields ?? {},
        imageFile: imageFile,
        imageFieldKey: imageFieldKey,
        token: token,
      );

      if (kDebugMode) {
        print("📥 [UserServices] Profile Picture Uploaded Successfully -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("❌ [UserServices] Profile Picture Upload Error -> $e");
      }
      rethrow;
    }
  }
}