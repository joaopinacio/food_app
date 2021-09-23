import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppRestaurantMenuProductCardComponent extends StatelessWidget with Component {
  /// ## AppRestaurantMenuProductCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  final Behaviour behaviour;

  const AppRestaurantMenuProductCardComponent({
    Key? key,
    required this.behaviour,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Container(
      width: 152.w,
      height: 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10.r,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
        color: AppThemes.colors.white,
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/image_food.png',
            fit: BoxFit.fitWidth,
            height: 132.h,
            width: double.infinity,
          ),
          SizedBox(height: AppThemes.spacing.spacer_6.h),
          AppTextStyles.medium_10(
            text: "Food One",
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            color: AppThemes.colors.black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppThemes.spacing.spacer_4.h),
          AppTextStyles.light_8(
            text: "lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet",
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            color: AppThemes.colors.black_50,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppThemes.spacing.spacer_8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextStyles.semiBold_8(
                text: "R\$",
                color: AppThemes.colors.black,
                margin: EdgeInsets.only(bottom: AppThemes.spacing.spacer_3.h),
              ),
              SizedBox(width: AppThemes.spacing.spacer_1.w),
              AppTextStyles.semiBold_14(
                text: "14,99",
                color: AppThemes.colors.black,
              ),
            ],
          ),
          Align(
            alignment: Alignment(0.38.w, 0),
            child: AppTextStyles.light_8(
              text: "R\$ 25,99",
              color: AppThemes.colors.black_30,
              textAlign: TextAlign.center,
              lineThrough: true,
            ),
          ),
          SizedBox(height: AppThemes.spacing.spacer_10.h),
        ],
      ),
    );
  }
}
