import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInitService {


  static bool _initialized = false;

  /// অ্যাপ শুরুতে একবার কল করুন।
  static Future<void> initialize({
    bool lockPortrait = true,
    bool edgeToEdge = true,
    void Function(Object error, StackTrace stack)? onError,
  }) async {
    if (_initialized) return;
    _initialized = true;

    WidgetsFlutterBinding.ensureInitialized();

    if (lockPortrait) {
      await SystemChrome.setPreferredOrientations(const [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    if (edgeToEdge) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    _setupErrorHandling(onError);

    // প্রথম ফ্রেমের আগেই সিস্টেম থিম অনুযায়ী ডিফল্ট স্টাইল সেট
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    SystemChrome.setSystemUIOverlayStyle(styleFor(platformBrightness));
  }

  /// Flutter ও Platform দুই ধরনের error ধরার ব্যবস্থা।
  /// Crashlytics / Sentry থাকলে `onError` এ পাঠান।
  static void _setupErrorHandling(
      void Function(Object error, StackTrace stack)? onError,
      ) {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
      onError?.call(details.exception, details.stack ?? StackTrace.current);
    };

    // Flutter framework এর বাইরের async error
    PlatformDispatcher.instance.onError = (error, stack) {
      if (kDebugMode) {
        debugPrint('Unhandled error: $error\n$stack');
      }
      onError?.call(error, stack);
      return true;
    };
  }

  /// MaterialApp / GetMaterialApp এর `builder` এ দিন।
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

  /// ফোনের system theme (settings থেকে) বদলালে এটা কল হয়।
  @override
  void didChangePlatformBrightness() {
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _apply(Theme.of(context).brightness);
  }

  /// শুধু brightness আসলেই বদলালে SystemChrome কল করে।
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








// GetMaterialApp(
// theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
// darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
// themeMode: ThemeMode.system, // অথবা আপনার saved theme
// builder: AppInitService.themeBuilder,
// )