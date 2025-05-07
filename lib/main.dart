import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadow_monarch/app/routes/app_pages.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';
import 'package:shadow_monarch/app/utils/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  await DependencyInjection.init();
  
  runApp(const ShadowMonarchApp());
}

class ShadowMonarchApp extends StatelessWidget {
  const ShadowMonarchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shadow Monarch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Default to dark theme for Solo Leveling aesthetic
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
