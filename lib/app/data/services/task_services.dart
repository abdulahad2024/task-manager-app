import 'package:flutter/foundation.dart';
import 'package:task_masenger_app/app/core/constants/api/api_endpoints.dart';
import 'package:task_masenger_app/app/core/network/network_service/network_service.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart'; // আপনার টোকেন স্টোরেজ পাথ অনুযায়ী দিন

class TaskServices {
  final NetworkService _networkService = NetworkService();
  final LocalAuthStorage _storage = LocalAuthStorage(); // লোকাল স্টোরেজ থেকে বিয়ারার টোকেন নেওয়ার জন্য

  // 1. Create Task (POST /tasks)
  Future<dynamic> createTask({
    required String title,
    required String description,
    String? status, // যেমন: 'pending', 'completed' ইত্যাদি
  }) async {
    try {
      final token = _storage.getAccessToken();
      final Map<String, dynamic> body = {
        "title": title,
        "description": description,
        if (status != null) "status": status,
      };

      if (kDebugMode) {
        print("📤 [TaskService] Create Task Request -> Body: $body");
      }

      final response = await _networkService.post(
        endpoint: ApiEndpoints.tasks, // আপনার ApiEndpoints-এ tasks রাউট পাথ থাকা লাগবে (যেমন: '/tasks')
        body: body,
        token: token,
      );

      if (kDebugMode) {
        print("📥 [TaskService] Create Task Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) print("❌ [TaskService] Create Task Error -> $e");
      rethrow;
    }
  }

  // 2. Get All Tasks (GET /tasks)
  Future<dynamic> getTasks() async {
    try {
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [TaskService] Get Tasks Request");
      }

      final response = await _networkService.get(
        endpoint: ApiEndpoints.tasks,
        token: token,
      );

      if (kDebugMode) {
        print("📥 [TaskService] Get Tasks Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) print("❌ [TaskService] Get Tasks Error -> $e");
      rethrow;
    }
  }

  // 3. Get Task By ID (GET /tasks/:id)
  Future<dynamic> getTaskById(String taskId) async {
    try {
      final token = _storage.getAccessToken();

      final response = await _networkService.get(
        endpoint: '${ApiEndpoints.tasks}/$taskId',
        token: token,
      );

      return response;
    } catch (e) {
      if (kDebugMode) print("❌ [TaskService] Get Task By ID Error -> $e");
      rethrow;
    }
  }

  // 4. Update Task (PATCH /tasks/:id)
  Future<dynamic> updateTask({
    required String taskId,
    required Map<String, dynamic> updatedFields, // যে ফিল্ডগুলো আপডেট করতে চান
  }) async {
    try {
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [TaskService] Update Task Request -> ID: $taskId | Body: $updatedFields");
      }

      final response = await _networkService.patch(
        endpoint: '${ApiEndpoints.tasks}/$taskId',
        body: updatedFields,
        token: token,
      );

      if (kDebugMode) {
        print("📥 [TaskService] Update Task Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) print("❌ [TaskService] Update Task Error -> $e");
      rethrow;
    }
  }

  // 5. Delete Task (DELETE /tasks/:id)
  Future<dynamic> deleteTask(String taskId) async {
    try {
      final token = _storage.getAccessToken();

      if (kDebugMode) {
        print("📤 [TaskService] Delete Task Request -> ID: $taskId");
      }

      final response = await _networkService.delete(
        endpoint: '${ApiEndpoints.tasks}/$taskId',
        token: token,
      );

      if (kDebugMode) {
        print("📥 [TaskService] Delete Task Response -> $response");
      }

      return response;
    } catch (e) {
      if (kDebugMode) print("❌ [TaskService] Delete Task Error -> $e");
      rethrow;
    }
  }
}