import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/styles/small/app_default_photo/app_default_photo_styles.dart';
import 'package:shimmer/shimmer.dart';

class AppNetWorkImageComponent extends StatelessWidget with Component {
  /// ## Network imagem
  ///
  /// __[behavior]__ Behaviour do component
  ///
  /// __[image]__ "URL" da imagem
  ///
  /// __[height]__ Tamanho da imagem
  ///
  /// __[boxFit]__ Estilo de preenchimento da imagem
  final Behaviour behaviour;
  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const AppNetWorkImageComponent({
    Key? key,
    required this.behaviour,
    required this.image,
    this.height,
    this.width,
    this.boxFit,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        color: Color(0xffEBEBEB).withOpacity(0.5),
        colorBlendMode: BlendMode.multiply,
        fit: boxFit ?? BoxFit.cover,
        imageUrl: image,
        height: height?.h ?? 50.h,
        width: width?.w ?? 50.w,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppThemes.colors.generalBlue),
          ),
        ),
        errorWidget: (context, url, error) => AppDefaultPhotoStyles.standard(),
      ),
    );
  }

  @override
  Widget whenLoading(BuildContext context, Behaviour childBehaviour) {
    return Shimmer.fromColors(
      highlightColor: AppThemes.colors.white,
      baseColor: AppThemes.colors.grayScale_1,
      child: Container(
        color: Colors.white,
        height: height?.h ?? 50.h,
        width: width?.w ?? 50.w,
      ),
    );
  }
}
