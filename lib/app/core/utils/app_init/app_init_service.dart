import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_masenger_app/app/data/local/local_auth_storage.dart';
import 'package:task_masenger_app/app/routes/app_pages.dart';

class AppInitService {
  static bool _initialized = false;

  /// অ্যাপ শুরুতে সব ইনিশিয়ালাইজেশন এবং রুট নির্ধারণ করে পুরো অ্যাপ রান করার মূল ফাংশন
  static Future<void> initAndRunApp({
    bool lockPortrait = true,
    bool edgeToEdge = true,
    void Function(Object error, StackTrace stack)? onError,
    String title = 'Task Manager App',
  }) async {
    if (_initialized) return;
    _initialized = true;

    // ১. ফ্লাটার বাইন্ডিং নিশ্চিত করা
    WidgetsFlutterBinding.ensureInitialized();

    // ২. GetStorage ইনিশিয়ালাইজ করা
    await GetStorage.init();

    // ৩. স্ক্রিন ওটেন্টেশন লক
    if (lockPortrait) {
      await SystemChrome.setPreferredOrientations(const [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    // ৪. এজ টু এজ ইউআই মোড
    if (edgeToEdge) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    // ৫. গ্লোবাল এরর হ্যান্ডলিং সেটআপ
    _setupErrorHandling(onError);

    // ৬. সিস্টেম থিম অনুযায়ী স্ট্যাটাসবার ও ন্যাভিগেশন বার কালার সেট
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    SystemChrome.setSystemUIOverlayStyle(styleFor(platformBrightness));

    // ৭. অনবোর্ডিং এবং লগইন স্ট্যাটাস চেক করে ডাইনামিক রুট নির্ধারণ
    final String initialRoute = _determineInitialRoute();

    // ৮. সবকিছু রেডি করে অ্যাপ রান করা
    runApp(
      _buildApp(
        routes: AppPages.routes,
        initialRoute: initialRoute,
        title: title,
      ),
    );
  }

  /// অনবোর্ডিং ও লগইন স্ট্যাটাস চেক করে সঠিক রুট সিলেক্ট করার লজিক
  static String _determineInitialRoute() {
    final storage = LocalAuthStorage();
    bool hasSeenOnboarding = storage.getHasSeenOnboarding();
    bool isLoggedIn = storage.isLoggedIn;

    if (hasSeenOnboarding) {
      if (isLoggedIn) {
        return Routes.BOTTOM_NAV; // লগইন করা থাকলে সরাসরি হোম/বটম ন্যাভে
      } else {
        return Routes.LOGIN; // অনবোর্ডিং দেখা শেষ কিন্তু লগইন করা নাই
      }
    } else {
      return Routes.ONBOARDING; // প্রথমবার অ্যাপ ইন্সটল করলে
    }
  }

  /// GetMaterialApp কনফিগারেশন ও রিটার্ন করার ফাংশন
  static Widget _buildApp({
    required List<GetPage<dynamic>> routes,
    required String initialRoute,
    required String title,
  }) {
    return GetMaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: routes,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      builder: themeBuilder,
    );
  }

  /// Flutter ও Platform দুই ধরনের error ধরার ব্যবস্থা।
  static void _setupErrorHandling(
      void Function(Object error, StackTrace stack)? onError,
      ) {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
      onError?.call(details.exception, details.stack ?? StackTrace.current);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      if (kDebugMode) {
        debugPrint('Unhandled error: $error\n$stack');
      }
      onError?.call(error, stack);
      return true;
    };
  }

  /// MaterialApp / GetMaterialApp এর `builder` এ ব্যবহারের জন্য।
  static Widget themeBuilder(BuildContext context, Widget? child) {
    return SystemUiThemeWrapper(child: child ?? const SizedBox.shrink());
  }

  /// Brightness অনুযায়ী System UI স্টাইল।
  static SystemUiOverlayStyle styleFor(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final iconBrightness = isDark ? Brightness.light : Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconBrightness, // Android
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light, // iOS
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: iconBrightness,
      systemNavigationBarContrastEnforced: false,
    );
  }
}

/// থিম বা সিস্টেম brightness বদলালেই System UI সাথে সাথে আপডেট করে।
class SystemUiThemeWrapper extends StatefulWidget {
  final Widget child;
  const SystemUiThemeWrapper({super.key, required this.child});

  @override
  State<SystemUiThemeWrapper> createState() => _SystemUiThemeWrapperState();
}

class _SystemUiThemeWrapperState extends State<SystemUiThemeWrapper>
    with WidgetsBindingObserver {
  Brightness? _appliedBrightness;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _apply(Theme.of(context).brightness);
  }

  void _apply(Brightness brightness) {
    if (_appliedBrightness == brightness) return;
    _appliedBrightness = brightness;
    SystemChrome.setSystemUIOverlayStyle(AppInitService.styleFor(brightness));
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    _apply(brightness);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppInitService.styleFor(brightness),
      child: widget.child,
    );
  }
}