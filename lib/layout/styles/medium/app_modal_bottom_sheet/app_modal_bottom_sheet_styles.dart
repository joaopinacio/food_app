import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/medium/app_modal_bottom_sheet/app_modal_bottom_sheet_component.dart';
import 'package:food_app/layout/styles/medium/app_text_button/app_text_button_styles.dart';
import 'package:food_app/layout/styles/small/app_counter/app_counter_styles.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppModalBottomSheetStyles {
  AppModalBottomSheetStyles._();

  /// ## AppModalBottomSheetStyles.standard
  ///
  /// __[title]__ Teste String
  ///
  static standard({
    required String title,
  }) =>
      showModalBottomSheetComponent(
        child: Container(
          height: 100,
          child: Center(
            child: Text(title),
          ),
        ),
      );

  /// ## AppModalBottomSheetStyles.product
  ///
  /// __[title]__ Teste String
  ///
  static product({
    String? image,
    required String title,
    required String price,
    int? qty,
    required String description,
    required Function() onSave,
    required Color colorQty,
    required Color colorQtyIcons,
    required bool isUserRestaurant,
  }) {
    showModalBottomSheetComponent(
      radiusTopLeft: 34.r,
      radiusTopRight: 34.r,
      child: Container(
        height: 560.h,
        child: Stack(
          children: [
            Container(
              height: 190.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(34.r), topRight: Radius.circular(34.r)),
                child: AppNetworkImageStyles.standard(
                  behaviour: Behaviour.regular,
                  image: image!,
                  boxFit: BoxFit.cover,
                  height: 100.h,
                  width: double.infinity,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                // Image.asset(
                //   image ?? 'assets/images/image_food.png',
                //   fit: BoxFit.fitWidth,
                //   height: 132.h,
                //   width: double.infinity,
                // ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 398.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppThemes.colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.r),
                    topRight: Radius.circular(34.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: AppThemes.spacing.spacer_20.h),
                    AppTextStyles.semiBold_18(
                      text: title,
                      color: AppThemes.colors.black,
                      margin: EdgeInsets.only(bottom: AppThemes.spacing.spacer_3.h),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_8.h),
                    Container(
                      width: price.length > 5 ? 205 : 165.w,
                      height: 36.h,
                      child: Stack(
                        children: [
                          Container(
                            width: price.length > 5 ? 145.w : 105.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34.r),
                                bottomLeft: Radius.circular(34.r),
                              ),
                              color: AppThemes.colors.grayScale_3,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.w),
                              child: Row(
                                children: [
                                  AppTextStyles.semiBold_8(
                                    text: "R\$",
                                    color: AppThemes.colors.black,
                                    margin: EdgeInsets.only(bottom: AppThemes.spacing.spacer_3.h),
                                  ),
                                  SizedBox(width: AppThemes.spacing.spacer_1.w),
                                  AppTextStyles.semiBold_14(
                                    text: price,
                                    color: AppThemes.colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AppCounterStyles.product(
                              behaviour: Behaviour.regular,
                              color: colorQty,
                              colorIcons: colorQtyIcons,
                              onChange: (value) {
                                print(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_14.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppTextStyles.medium_14(
                          text: "Ingredients",
                          color: AppThemes.colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                      child: Container(
                        height: 75.h,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          // listFoodIngredients.map((item) { }).toList(),
                          children: [
                            AppThemes.shimmer.circle(size: 75),
                            SizedBox(width: AppThemes.spacing.spacer_10.w),
                            AppThemes.shimmer.circle(size: 75),
                            SizedBox(width: AppThemes.spacing.spacer_10.w),
                            AppThemes.shimmer.circle(size: 75),
                            SizedBox(width: AppThemes.spacing.spacer_10.w),
                            AppThemes.shimmer.circle(size: 75),
                            SizedBox(width: AppThemes.spacing.spacer_10.w),
                            AppThemes.shimmer.circle(size: 75),
                            SizedBox(width: AppThemes.spacing.spacer_10.w),
                            AppThemes.shimmer.circle(size: 75),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppTextStyles.medium_14(
                          text: "Details",
                          color: AppThemes.colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_4.h),
                    AppTextStyles.regular_12(
                      text: description,
                      color: AppThemes.colors.black_50,
                      maxLines: 3,
                      margin: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Opacity(
                      opacity: isUserRestaurant ? 0.3 : 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppThemes.spacing.spacer_24.w),
                        child: AppTextButtonStyles.rounded(
                          height: 57,
                          width: double.infinity,
                          hasBounce: isUserRestaurant ? false : true,
                          textStyle: AppThemes.typography.poppinsBold_14,
                          label: 'Add to Cart',
                          onTap: isUserRestaurant ? () {} : onSave,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
