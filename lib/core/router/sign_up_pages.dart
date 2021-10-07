import 'package:food_app/pages/restaurant_menu/restaurant_menu_page.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_page_bindings.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_one/sign_up_step_one_page.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_one/sign_up_step_one_page_bindings.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_three/sign_up_step_three_page.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_three/sign_up_step_three_page_bindings.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_two/sign_up_step_two_page.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_two/sign_up_step_two_page_bindings.dart';
import 'package:get/get.dart';

mixin SignUpPages {
  final signUpStepOne = '/sign_up_step_one';
  final signUpStepTwo = '/sign_up_step_two';
  final signUpStepThree = '/sign_up_step_three';

  get signUpStepOnePage => GetPage(
        name: signUpStepOne,
        page: () => SignUpStepOnePage(),
        binding: SignUpStepOnePageBindings(),
        transition: Transition.cupertino,
      );

  get signUpStepTwoPage => GetPage(
        name: signUpStepTwo,
        page: () => SignUpStepTwoPage(),
        binding: SignUpStepTwoPageBindings(),
        transition: Transition.noTransition,
      );

  get signUpStepThreePage => GetPage(
        name: signUpStepThree,
        page: () => SignUpStepThreePage(),
        binding: SignUpStepThreePageBindings(),
        transition: Transition.noTransition,
      );

  List<GetPage<dynamic>> get getSignUpPagesList => [
        signUpStepOnePage,
        signUpStepTwoPage,
        signUpStepThreePage,
      ];
}
