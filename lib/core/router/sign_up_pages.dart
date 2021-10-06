import 'package:food_app/pages/restaurant_menu/restaurant_menu_page.dart';
import 'package:food_app/pages/restaurant_menu/restaurant_menu_page_bindings.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_one/sign_up_step_one_page.dart';
import 'package:food_app/pages/sign_up/sign_up_pages/sign_up_step_one/sign_up_step_one_page_bindings.dart';
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

  List<GetPage<dynamic>> get getSignUpPagesList => [
        signUpStepOnePage,
      ];
}
