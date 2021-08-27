import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';

class AppCarouselSliderCardComponent extends StatelessWidget {
  /// ## AppCarouselSliderCardComponent
  ///
  /// __[logoImage]__ Imagem da logo a ser mostrada
  ///
  /// __[primaryImage]__ Imagem principal do card
  ///
  /// __[title]__ Titulo do card
  ///
  /// __[mainColor]__ Cor principal de fundo
  ///
  /// __[onTap]__ Clique do card
  ///
  final String logoImage;
  final String primaryImage;
  final String title;
  final Color mainColor;
  final Function() onTap;

  const AppCarouselSliderCardComponent({
    Key? key,
    required this.logoImage,
    required this.primaryImage,
    required this.title,
    required this.mainColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext contextCard) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Image.asset(
                "assets/icons/bag-icon.png",
                scale: 7.sp,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: MediaQuery.of(contextCard).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.r)), color: Colors.white),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                        child: Container(
                          height: 300.h,
                          width: 300.w,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.r)), color: mainColor),
                          alignment: Alignment.center,
                          child: Hero(
                            tag: logoImage,
                            child: Image.asset(
                              primaryImage,
                              scale: 7.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppThemes.spacing.spacer_20.h),
                      AppTextStyles.standard(text: title),
                      // TextCustom("Food App", Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w600),
                      SizedBox(height: AppThemes.spacing.spacer_20.h),
                      AppTextStyles.standard(text: "Text"),
                      // TextCustom("Text", Colors.black, fontSize: 15),
                      SizedBox(height: AppThemes.spacing.spacer_20.h),
                      AppTextStyles.standard(text: "Text"),
                      // TextCustom("Text", Colors.black, fontSize: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
