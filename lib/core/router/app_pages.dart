import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/pages/home/home_page_bindings.dart';
import 'package:food_app/pages/login/login_page.dart';
import 'package:food_app/pages/login/login_page_bindings.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:food_app/pages/splash/splash_page_bindings.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  AppPages._();

  static final AppPages instance = AppPages._();

  final splash = '/splash';
  final login = '/login';
  final home = '/home';

  get splashPage => GetPage(
        name: splash,
        page: () => SplashPage(),
        binding: SplashPageBindings(),
        transition: Transition.noTransition,
      );

  get loginPage => GetPage(
        name: login,
        page: () => LoginPage(),
        binding: LoginPageBindings(),
        transition: Transition.noTransition,
        transitionDuration: Duration(milliseconds: 1500),
      );

  get homePage => GetPage(
        name: home,
        page: () => HomePage(),
        binding: HomePageBindings(),
        transition: Transition.noTransition,
      );

  List<GetPage<dynamic>>? get getPagesList => [
        splashPage,
        loginPage,
        homePage,
      ];
}
