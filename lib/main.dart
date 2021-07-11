import 'package:food_app/core/router/app_pages.dart';
import 'package:food_app/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/lang/translation_service.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.changeTheme(ThemeData.light());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var translationService = TranslationService();

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: translationService,
        getPages: AppPages.instance.getPagesList,
        initialRoute: AppPages.instance.splash,
        initialBinding: MainBindings(),
        theme: ThemeData(
          primaryColor: AppThemes.colors.primaryColor,
          scaffoldBackgroundColor: AppThemes.colors.white,
        ),
      ),
    );
  }
}
