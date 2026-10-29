import 'package:get_storage/get_storage.dart';
import 'package:task_masenger_app/app/core/constants/config/app_config.dart'; // আপনার AppConfig পাথ অনুযায়ী ঠিক করে নিবেন

class LocalAuthStorage {
  // Singleton pattern যাতে পুরো প্রজেক্টে একটাই ইনস্ট্যান্স ব্যবহার হয়
  static final LocalAuthStorage _instance = LocalAuthStorage._internal();
  factory LocalAuthStorage() => _instance;
  LocalAuthStorage._internal();

  final GetStorage _box = GetStorage();

  // ==================== TOKEN MANAGEMENT ====================

  // ১. টোকেন সেভ করা
  Future<void> saveAccessToken(String token) async {
    await _box.write(AppConfig.tokenKey, token);
  }

  // ২. টোকেন রিড করা
  String? getAccessToken() {
    return _box.read<String>(AppConfig.tokenKey);
  }

  // ৩. রিফ্রেশ টোকেন সেভ ও রিড করা (যদি থাকে)
  Future<void> saveRefreshToken(String refreshToken) async {
    await _box.write('refresh_token', refreshToken);
  }

  String? getRefreshToken() {
    return _box.read<String>('refresh_token');
  }

  // ==================== USER DATA MANAGEMENT ====================

  // ৪. ইউজারের পুরো ডাটা (Map) সেভ করা
  Future<void> saveUserData(Map<String, dynamic> userJson) async {
    await _box.write(AppConfig.userKey, userJson);
  }

  // ৫. ইউজারের ডাটা রিড করা
  Map<String, dynamic>? getUserData() {
    return _box.read<Map<String, dynamic>>(AppConfig.userKey);
  }

  // ==================== LOGIN STATUS / MISC ====================

  // ৬. ইউজার লগইন করা আছে কি না চেক করার জন্য
  bool get isLoggedIn {
    final token = getAccessToken();
    return token != null && token.isNotEmpty;
  }

  // ৭. ডার্ক মোড বা অন্যান্য সেটিংস সেভ করা
  Future<void> saveThemeMode(bool isDark) async {
    await _box.write(AppConfig.themeKey, isDark);
  }

  bool getThemeMode() {
    return _box.read<bool>(AppConfig.themeKey) ?? false;
  }

  // ==================== LOGOUT / CLEAR ====================

  // ৮. লগআউট করার সময় সব লোকাল ডেটা ক্লিয়ার বা ডিলিট করা
  Future<void> clearAuthData() async {
    await _box.remove(AppConfig.tokenKey);
    await _box.remove('refresh_token');
    await _box.remove(AppConfig.userKey);
    // অথবা পুরো বক্স ক্লিয়ার করতে চাইলে: await _box.erase();
  }


  // Remember Me ইমেইল সেভ করা
  Future<void> saveRememberedEmail(String email) async {
    await _box.write('remembered_email', email);
  }

  // Remembered ইমেইল রিড করা
  String? getRememberedEmail() {
    return _box.read<String>('remembered_email');
  }

  // Remembered ইমেইল ক্লিয়ার করা
  Future<void> clearRememberedEmail() async {
    await _box.remove('remembered_email');
  }


  // ১. অনবোর্ডিং দেখা শেষ হলে true সেভ করা
  Future<void> setOnboardingSeen() async {
    await _box.write('has_seen_onboarding', true);
  }

  // ২. অনবোর্ডিং দেখা হয়েছে কি না চেক করা
  bool getHasSeenOnboarding() {
    return _box.read<bool>('has_seen_onboarding') ?? false;
  }


}