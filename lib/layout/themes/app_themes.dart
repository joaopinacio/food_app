import 'package:food_app/layout/themes/colors/app_colors.dart';
import 'package:food_app/layout/themes/icons/app_icons.dart';
import 'package:food_app/layout/themes/shimmer/app_shimmer.dart';
import 'package:food_app/layout/themes/spacing/app_spacing.dart';
import 'package:food_app/layout/themes/typography/app_typography.dart';

class AppThemes {
  AppThemes._();

  /// Cores padrões
  static AppColors get colors => AppColors();

  /// Tipografia padrão
  static AppTypography get typography => AppTypography();

  /// Espaçamentos padrões
  static AppSpacing get spacing => AppSpacing();

  // Shimmers padrões
  static AppShimmer get shimmer => AppShimmer();

  /// Icones padrões
  static AppIcons get icons => AppIcons();
}
