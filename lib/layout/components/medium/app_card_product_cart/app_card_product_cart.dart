import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_counter/app_counter_styles.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';

typedef IntCallback(int);

class AppCardProductCartComponent extends StatelessWidget with Component {
  /// ## AppCardProductCartComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[name]__ Nome do Produto
  ///
  /// __[totalPrice]__ Preço total do Produto
  ///
  /// __[productQty]__ Quantidade total do Produto
  ///
  /// __[onChangeQty]__ Funcao onChange na Quantidade do produto
  ///
  /// __[mainColor]__ Cor do restaurante
  ///
  /// __[iconsColor]__ Cor dos Icones
  ///
  /// __[imageUrl]__ Imagem do Produto
  ///
  /// __[onRemove]__ Funcao de remover o Produto do carrinho
  ///
  final Behaviour behaviour;
  final String name;
  final String totalPrice;
  final int productQty;
  final IntCallback onChangeQty;
  final Color mainColor;
  final Color iconsColor;
  final String imageUrl;
  final Function() onRemove;

  const AppCardProductCartComponent({
    Key? key,
    required this.behaviour,
    required this.name,
    required this.totalPrice,
    required this.productQty,
    required this.onChangeQty,
    required this.mainColor,
    required this.iconsColor,
    required this.imageUrl,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour behaviour) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Container(
        width: 340.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImageStyles.standard(
              behaviour: behaviour,
              image: imageUrl,
              height: 80.sp,
              width: 90.sp,
              borderRadius: BorderRadius.circular(10.r),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 197.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyles.medium_12(
                    text: name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  AppTextStyles.regular_12(
                    text: totalPrice,
                    color: AppThemes.colors.black_50,
                  ),
                  SizedBox(height: 21.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCounterStyles.mini(
                        behaviour: Behaviour.regular,
                        initialValue: productQty,
                        color: mainColor,
                        colorIcons: iconsColor,
                        onChange: onChangeQty,
                        min: 1,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: onRemove,
                        child: Container(
                          width: 35.sp,
                          height: 35.sp,
                          decoration: BoxDecoration(
                            color: AppThemes.colors.grayScale_3,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Icon(AppThemes.icons.delete, color: AppThemes.colors.black_30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
