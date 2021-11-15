import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';

class AppCarouselSliderCardComponent extends StatelessWidget with Component {
  /// ## AppCarouselSliderCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[logoImage]__ Imagem da logo a ser mostrada
  ///
  /// __[primaryImage]__ Imagem principal do card
  ///
  /// __[title]__ Titulo do card
  ///
  /// __[description]__ Descrição do card
  ///
  /// __[type]__ Tipo do restaurante
  ///
  /// __[rate]__ Avaliação do card
  ///
  /// __[mainColor]__ Cor principal de fundo
  ///
  /// __[onTap]__ Clique do card
  ///
  final Behaviour behaviour;
  final String logoImage;
  final String primaryImage;
  final String title;
  final String description;
  final String type;
  final String rate;
  final Color mainColor;
  final Function() onTap;

  const AppCarouselSliderCardComponent({
    Key? key,
    required this.logoImage,
    required this.primaryImage,
    required this.title,
    required this.description,
    required this.type,
    required this.rate,
    required this.mainColor,
    required this.onTap,
    required this.behaviour,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Builder(
      builder: (BuildContext contextCard) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Hero(
                tag: logoImage,
                child: AppNetworkImageStyles.standard(
                  behaviour: behaviour,
                  image: logoImage,
                  height: 50.h,
                  width: 60.w,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: MediaQuery.of(contextCard).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)), color: AppThemes.colors.white),
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                        child: Container(
                          height: 240.h,
                          width: 240.w,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.r)), color: mainColor),
                          alignment: Alignment.center,
                          child: AppNetworkImageStyles.standard(
                            behaviour: behaviour,
                            image: primaryImage,
                            height: 90.h,
                            width: 100.w,
                            boxFit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(height: AppThemes.spacing.spacer_20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextStyles.bold_18(text: title),
                            Icon(Icons.favorite_rounded, color: AppThemes.colors.generalRed),
                          ],
                        ),
                      ),
                      // TextCustom("Food App", Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w600),
                      SizedBox(height: AppThemes.spacing.spacer_14.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          children: [
                            Icon(Icons.star_rounded, color: AppThemes.colors.generalYellow),
                            AppTextStyles.medium_14(text: rate),
                            SizedBox(width: 10.w),
                            AppTextStyles.medium_14(text: '•'),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppTextStyles.medium_14(
                                text: type,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // TextCustom("Text", Colors.black, fontSize: 15),
                      SizedBox(height: AppThemes.spacing.spacer_16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child:
                            AppTextStyles.regular_10(text: description, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
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

  @override
  Widget whenLoading(BuildContext context, Behaviour childBehaviour) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: AppThemes.shimmer.circle(size: 57.sp),
        ),
        Expanded(
          child: AppThemes.shimmer.rectangle(
            height: 250.h,
            width: MediaQuery.of(context).size.width,
            borderRadius: 20,
            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          ),
        ),
      ],
    );
  }
}
