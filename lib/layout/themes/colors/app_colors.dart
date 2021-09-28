import 'package:flutter/painting.dart';

class AppColors {
  Color get black => Color(0xff000000);
  Color get white => Color(0xffFFFFFF);

  Color get black_50 => Color(0xff000000).withOpacity(0.5);
  Color get black_40 => Color(0xff000000).withOpacity(0.4);
  Color get black_30 => Color(0xff000000).withOpacity(0.3);

  Color get primaryColor => Color(0xFFF02B3C);

  Color get grayScale_1 => Color(0xffF2F2F2);
  Color get grayScale_2 => Color(0xffD8D8D8);
  Color get grayScale_3 => Color(0xffF5F5F5);

  Color get generalRed => Color(0xffF02B3C);
  Color get generalBlue => Color(0xff1EB4F4);
  Color get generalGreen => Color(0xFF1ED760);

  List<Map<String, Color>> get namedColors => [
        {'black': black},
        {'white': white},
        {'primaryColor': primaryColor},
        {'grayScale_1': grayScale_1},
        {'generalRed': generalRed},
        {'generalBlue': generalBlue},
        {'generalGreen': generalGreen},
      ];
}
