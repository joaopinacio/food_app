import 'package:bouncing_widget/bouncing_widget.dart';
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

  const AppRestaurantMenuProductCardComponent({
    Key? key,
    required this.behaviour,
    required this.title,
    this.image,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return BouncingWidget(
      duration: Duration(milliseconds: 100),
      scaleFactor: 0.5,
      onPressed: onTap,
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
            Image.asset(
              image ?? 'assets/images/image_food.png',
              fit: BoxFit.fitWidth,
              height: 132.h,
              width: double.infinity,
            ),
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
                  text: price,
                  color: AppThemes.colors.black,
                ),
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
            SizedBox(height: AppThemes.spacing.spacer_10.h),
          ],
        ),
      ),
    );
  }
}
