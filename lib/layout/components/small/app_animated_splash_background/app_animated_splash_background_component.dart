import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppAnimatedSplashBackgroundComponent extends StatefulWidget {
  final double size;
  final int duration;

  const AppAnimatedSplashBackgroundComponent({
    required this.size,
    required this.duration,
  });

  @override
  _AppAnimatedSplashBackgroundComponentState createState() =>
      _AppAnimatedSplashBackgroundComponentState();
}

class _AppAnimatedSplashBackgroundComponentState
    extends State<AppAnimatedSplashBackgroundComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    Future.delayed(Duration(milliseconds: 2000), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.scale(
        scale: Tween<double>(begin: 0, end: widget.size)
            .animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(0, 1, curve: Curves.easeInOutSine),
              ),
            )
            .value,
        child: Container(
          decoration: BoxDecoration(
            color: AppThemes.colors.primaryColor,
            borderRadius: BorderRadius.circular(100.0),
          ),
          height: 30.h,
          width: 30.w,
        ),
      ),
    );
  }
}
