import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/classes/behaviour.dart';
import 'package:food_app/core/classes/component.dart';
import 'package:food_app/layout/app_layout_imports.dart';
import 'package:food_app/layout/components/small/app_text/app_text_component.dart';
import 'package:food_app/layout/styles/small/app_text/app_text_styles.dart';
import 'package:food_app/layout/themes/app_themes.dart';
import 'package:holding_gesture/holding_gesture.dart';

typedef IntCallback(int);

class AppCounterComponent extends StatefulWidget {
  /// ## AppCounterComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[max]__ Maximo
  ///
  /// __[min]__ Minimo
  ///
  /// __[initialValue]__ Valor Inicial
  ///
  /// __[onChange]__ Callback do contador
  ///
  /// __[width]__ Largura do componente
  ///
  /// __[height]__ Altura do componente
  ///
  /// __[color]__ Cor do componente
  ///
  /// __[colorIcons]__ Cor dos Icones
  ///
  final Behaviour behaviour;
  final int? max;
  final int? min;
  final int? initialValue;
  final double width;
  final double height;
  final Color color;
  final Color colorIcons;
  final IntCallback onChange;

  AppCounterComponent({
    Key? key,
    required this.behaviour,
    this.max = 100,
    this.min = 0,
    this.initialValue = 0,
    required this.width,
    required this.height,
    required this.color,
    required this.colorIcons,
    required this.onChange,
  });

  @override
  State<AppCounterComponent> createState() => _AppCounterComponentState();
}

class _AppCounterComponentState extends State<AppCounterComponent> with Component {
  late int _number;

  @override
  void initState() {
    super.initState();
    _number = widget.initialValue!;
  }

  void _add() {
    if (_number < widget.max!) {
      setState(() {
        _number++;
      });
      widget.onChange(_number);
    }
  }

  void _remove() {
    if (_number > widget.min!) {
      setState(() {
        _number--;
      });
      widget.onChange(_number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return render(context, widget.behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Container(
      width: widget.width.w,
      height: widget.height.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36.r)),
        color: widget.color,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: HoldDetector(
              onHold: _remove,
              holdTimeout: Duration(milliseconds: 1),
              child: IconButton(
                color: AppThemes.colors.white,
                icon: Icon(Icons.remove),
                iconSize: 20.sp,
                onPressed: _remove,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
                color: AppThemes.colors.white,
              ),
              child: Center(
                child: AppTextStyles.medium_16(text: _number.toString(), color: AppThemes.colors.black),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: HoldDetector(
              onHold: _add,
              holdTimeout: Duration(milliseconds: 100),
              child: IconButton(
                color: AppThemes.colors.white,
                icon: Icon(Icons.add),
                iconSize: 20.sp,
                onPressed: _add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
