import 'package:flare_flutter/flare_actor.dart';
import 'package:food_app/core/auxiliary_widgets/app_alert_dialog.dart';
import 'package:food_app/layout/app_layout_imports.dart';

class AppAlertStatus {
  AppAlertStatus._();

  static showSuccess() => AppAlertDialog.showDialogDefault(
        autoHide: true,
        widget: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: CircleAvatar(
                  backgroundColor: AppThemes.colors.white,
                  radius: 55.0,
                  child: FlareActor(
                    'assets/animations/flare/succes_without_loop.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                    animation: 'Untitled',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
