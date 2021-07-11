import 'package:food_app/pages/splash/splash_page.dart';
import 'package:food_app/pages/splash/splash_page_bindings.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  AppPages._();

  static final AppPages instance = AppPages._();

  final splash = '/splash';

  get splashPage => GetPage(
        name: splash,
        page: () => SplashPage(),
        binding: SplashPageBindings(),
        transition: Transition.fadeIn,
      );

  List<GetPage<dynamic>>? get getPagesList => [
        splashPage,
      ];
}
