import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppRestaurantMenuTypeCardComponent extends StatelessWidget with Component {
  /// ## AppRestaurantMenuTypeCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo do card
  ///
  /// __[image]__ imagem do card (icone)
  ///
  final Behaviour behaviour;
  final String title;
  final String? image;

  const AppRestaurantMenuTypeCardComponent({
    Key? key,
    required this.behaviour,
    required this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Container(
      width: 75.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        color: AppThemes.colors.primaryColor,
      ),
      margin: EdgeInsets.only(right: 12.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image ?? 'assets/images/drumstick-icon.png',
            scale: 10.sp,
          ),
          SizedBox(height: AppThemes.spacing.spacer_16.h),
          AppTextStyles.semiBold_10(text: title, color: AppThemes.colors.white),
        ],
      ),
    );
  }
}
