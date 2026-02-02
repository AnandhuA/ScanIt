import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_it/app/theme/app_theam.dart';
import 'package:scan_it/utils/constants/app_assets.dart';
import 'package:scan_it/widgets/error_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body: AppErrorWidget(
          refresh: () {},
          lottiePath: AppAssets.noInternetConnection,
        ),
      ),
    );
  }
}
