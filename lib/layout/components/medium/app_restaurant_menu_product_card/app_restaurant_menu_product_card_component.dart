import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_ink_well/app_ink_well_styles.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';

class AppRestaurantMenuProductCardComponent extends StatelessWidget with Component {
  /// ## AppRestaurantMenuProductCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo do card (nome do produto)
  ///
  /// __[image]__ imagem do produto
  ///
  /// __[description]__ Subtitulo do card (descricao do produto)
  ///
  /// __[price]__ Preco do produto
  ///
  /// __[oldPrice]__ Antigo preco do produto (desconto)
  ///
  final Behaviour behaviour;
  final String title;
  final String? image;
  final String description;
  final String price;
  final String? oldPrice;
  final Function() onTap;
  final bool inCart;
  final int listGridLength;

  const AppRestaurantMenuProductCardComponent({
    Key? key,
    required this.behaviour,
    required this.title,
    this.image,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.onTap,
    required this.inCart,
    required this.listGridLength,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    if (listGridLength == 1) {
      return AppInkWellStyles.standard(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Container(
            height: 105.h,
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
            child: Stack(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: AppNetworkImageStyles.standard(
                        behaviour: Behaviour.regular,
                        image: image!,
                        boxFit: BoxFit.cover,
                        height: 110,
                        width: double.infinity,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(height: AppThemes.spacing.spacer_6.h),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextStyles.medium_10(
                              text: title,
                              color: AppThemes.colors.black,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: AppThemes.spacing.spacer_4.h),
                            AppTextStyles.light_8(
                              text: description,
                              color: AppThemes.colors.black_50,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppTextStyles.semiBold_8(
                                  text: "R\$",
                                  color: AppThemes.colors.black,
                                  margin: EdgeInsets.only(bottom: AppThemes.spacing.spacer_3.h),
                                ),
                                SizedBox(width: AppThemes.spacing.spacer_1.w),
                                listGridLength == 3
                                    ? AppTextStyles.semiBold_12(
                                        text: price,
                                        color: AppThemes.colors.black,
                                      )
                                    : AppTextStyles.semiBold_14(
                                        text: price,
                                        color: AppThemes.colors.black,
                                      ),
                                SizedBox(width: AppThemes.spacing.spacer_4.w),
                                Visibility(
                                  visible: oldPrice != null,
                                  child: AppTextStyles.light_8(
                                    text: oldPrice != null ? 'R\$ $oldPrice' : '',
                                    margin: EdgeInsets.only(top: 5.h),
                                    color: AppThemes.colors.black_30,
                                    textAlign: TextAlign.center,
                                    lineThrough: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: inCart,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: AppThemes.colors.generalBlue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppThemes.colors.white,
                        size: 13.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return AppInkWellStyles.standard(
      onTap: onTap,
      child: Container(
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
            AppNetworkImageStyles.standard(
              behaviour: Behaviour.regular,
              image: image!,
              boxFit: BoxFit.cover,
              height: listGridLength == 3 ? 50 : 125,
              width: double.infinity,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            // Image.asset(
            //   'assets/images/image_food.png',
            //   fit: BoxFit.fitWidth,
            //   height: 132.h,
            //   width: double.infinity,
            // ),
            SizedBox(height: AppThemes.spacing.spacer_6.h),
            AppTextStyles.medium_10(
              text: title,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              color: AppThemes.colors.black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppThemes.spacing.spacer_4.h),
            AppTextStyles.light_8(
              text: description,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              color: AppThemes.colors.black_50,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextStyles.semiBold_8(
                  text: "R\$",
                  color: AppThemes.colors.black,
                  margin: EdgeInsets.only(bottom: AppThemes.spacing.spacer_3.h),
                ),
                SizedBox(width: AppThemes.spacing.spacer_1.w),
                listGridLength == 3
                    ? AppTextStyles.semiBold_12(
                        text: price,
                        color: AppThemes.colors.black,
                      )
                    : AppTextStyles.semiBold_14(
                        text: price,
                        color: AppThemes.colors.black,
                      )
              ],
            ),
            Visibility(
              visible: oldPrice != null,
              child: Align(
                alignment: Alignment(0.38.w, 0),
                child: AppTextStyles.light_8(
                  text: oldPrice != null ? 'R\$ $oldPrice' : '',
                  color: AppThemes.colors.black_30,
                  textAlign: TextAlign.center,
                  lineThrough: true,
                ),
              ),
            ),
            Spacer(),
            Visibility(
              visible: inCart,
              child: Container(
                width: double.infinity,
                height: 17.h,
                decoration: BoxDecoration(
                  color: AppThemes.colors.generalBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppThemes.colors.white,
                  size: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
