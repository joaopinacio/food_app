import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_network_image/app_network_image_styles.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';

class AppProductCardComponent extends StatelessWidget with Component {
  /// ## AppProductCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[name]__ Nome do Produto
  ///
  /// __[price]__ Preço do Produto
  ///
  /// __[oldPrice]__ Antigo Preço do Produto
  ///
  /// __[imageUrl]__ Imagem do Produto\
  ///
  /// __[onTap]__ Tap do component
  ///
  final Behaviour behaviour;
  final String name;
  final String price;
  final String? oldPrice;
  final String imageUrl;
  final Function() onTap;

  const AppProductCardComponent({
    Key? key,
    required this.behaviour,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour behaviour) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              AppNetworkImageStyles.standard(
                behaviour: behaviour,
                image: imageUrl,
                height: 50.h,
                width: 60.w,
                borderRadius: BorderRadius.circular(50.r),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyles.semiBold_14(text: name, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 5.h),
                  AppTextStyles.semiBold_14(text: price),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.h,
          color: AppThemes.colors.grayScale_3,
        ),
      ],
    );
  }

  @override
  Widget whenLoading(BuildContext context, Behaviour childBehaviour) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              AppThemes.shimmer.circle(size: 60.sp),
              SizedBox(width: 10.w),
              Column(
                children: [
                  AppThemes.shimmer.rectangle(height: 20.h, width: 230.w),
                  SizedBox(height: 5.h),
                  AppThemes.shimmer.rectangle(height: 20.h, width: 230.w),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.h,
          color: AppThemes.colors.grayScale_3,
        ),
      ],
    );
  }
}
