import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/routes/app_views.dart';
import 'package:redditum_flapp/core/config/app_config.dart';
import 'package:redditum_flapp/core/network/dio_config.dart';
import 'package:redditum_flapp/core/utils/dependency_injection.dart';

void main() {
  AppConfig.init();
  DioConfig.init();
  DependencyInjection.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Redditum FlApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          snackBarTheme: const SnackBarThemeData(
            contentTextStyle: TextStyle(fontFamily: "DroidSans"),
          ),
          fontFamily: 'DroidSans',
        ),
        initialRoute: AppRoutes.splash,
        getPages: AppViews.views,
      ),
    );
  }
}
