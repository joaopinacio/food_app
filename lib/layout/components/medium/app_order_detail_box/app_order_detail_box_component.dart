import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:get/get.dart';

class AppOrderDetailBoxComponent extends StatelessWidget with Component {
  /// ## AppOrderDetailBoxComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[total]__ Total do Pedido
  ///
  /// __[onTapEmpty]__ Funcao Tap para esvaziar o carrinho
  ///
  /// __[onTapConclude]__ Funcao Tap para concluir o pedido
  ///
  /// __[isActive]__ Funcao Tap para concluir o pedido
  ///
  final Behaviour behaviour;
  final String total;
  final Function() onTapEmpty;
  final Function() onTapConclude;
  final bool isActive;

  const AppOrderDetailBoxComponent({
    Key? key,
    required this.behaviour,
    required this.total,
    required this.onTapEmpty,
    required this.onTapConclude,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour behaviour) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppThemes.colors.white,
        border: Border.all(
          width: 0.1.sp,
          color: AppThemes.colors.black_50,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppThemes.colors.black_15,
            blurRadius: 10.r,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          AppTextStyles.semiBold_18(text: 'Total: $total'),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: isActive ? onTapEmpty : () {},
                  child: Container(
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: isActive ? AppThemes.colors.generalRed : AppThemes.colors.black_50,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            AppThemes.icons.delete,
                            color: AppThemes.colors.white,
                            size: 19.sp,
                          ),
                          SizedBox(width: 5.w),
                          AppTextStyles.medium_12(
                            text: 'empty_cart'.tr,
                            color: AppThemes.colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.5.sp,
                color: AppThemes.colors.white,
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: isActive ? onTapConclude : () {},
                  child: Container(
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: isActive ? AppThemes.colors.generalGreen : AppThemes.colors.black_50,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: AppThemes.colors.white),
                          SizedBox(width: 5.w),
                          AppTextStyles.medium_12(
                            text: 'conclude'.tr,
                            color: AppThemes.colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
