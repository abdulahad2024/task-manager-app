


import 'export.dart';


void main() async {

  await AppInitService.initAndRunApp();

  runApp(
    GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      builder: AppInitService.themeBuilder,
      themeMode: ThemeMode.light,
    ),
  );
}
