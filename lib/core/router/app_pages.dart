import 'package:food_app/core/router/restaurant_menu_pages.dart';
import 'package:food_app/core/router/restaurant_pages.dart';
import 'package:food_app/core/router/sign_up_pages.dart';
import 'package:food_app/pages/aux_pages/camera/camera_page.dart';
import 'package:food_app/pages/aux_pages/camera/camera_page_bindings.dart';
import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/pages/home/home_page_bindings.dart';
import 'package:food_app/pages/login/login_page.dart';
import 'package:food_app/pages/login/login_page_bindings.dart';
import 'package:food_app/pages/restaurants/restaurants_page.dart';
import 'package:food_app/pages/restaurants/restaurants_page_bindings.dart';
import 'package:food_app/pages/sign_up/sign_up_page.dart';
import 'package:food_app/pages/sign_up/sign_up_page_bindings.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:food_app/pages/splash/splash_page_bindings.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages with SignUpPages, RestaurantPages, RestaurantMenuPages {
  AppPages._();

  static final AppPages instance = AppPages._();

  final splash = '/splash';
  final login = '/login';
  final signUp = '/signUp';
  final home = '/home';
  final restaurants = '/restaurants';
  final camera = '/camera';

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

  get signUpPage => GetPage(
        name: signUp,
        page: () => SignUpPage(),
        binding: SignUpPageBindings(),
        transition: Transition.cupertino,
      );

  get homePage => GetPage(
        name: home,
        page: () => HomePage(),
        binding: HomePageBindings(),
        transition: Transition.noTransition,
      );

  get restaurantsPage => GetPage(
        name: restaurants,
        page: () => RestaurantsPage(),
        binding: RestaurantsPageBindings(),
        transition: Transition.noTransition,
      );

  get cameraPage => GetPage(
        name: camera,
        page: () => CameraPage(),
        binding: CameraPageBindings(),
        transition: Transition.cupertino,
      );

  List<GetPage<dynamic>>? get getPagesList => [
        splashPage,
        loginPage,
        signUpPage,
        homePage,
        cameraPage,
        restaurantsPage,
        ...getSignUpPagesList,
        ...getRestaurantPagesList,
        ...getRestaurantMenuPagesList,
      ];
}
