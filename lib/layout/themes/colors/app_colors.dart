import 'package:flutter/painting.dart';

class AppColors {
  Color get black => Color(0xff000000);
  Color get white => Color(0xffFFFFFF);

  Color get primaryColor => Color(0xFFF02B3C);

  Color get grayScale_1 => Color(0xffF2F2F2);

  List<Map<String, Color>> get namedColors => [
        {'black': black},
        {'white': white},
        {'primaryColor': primaryColor},
        {'grayScale_1': grayScale_1},
      ];
}
