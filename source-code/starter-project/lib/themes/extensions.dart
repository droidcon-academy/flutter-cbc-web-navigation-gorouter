import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';
import 'themes.dart';
import 'themes/themes.light.dart';
import 'typography.dart';

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>() ?? LightAppTheme();

  AppThemeTypography get typographies => appTheme.typographies;

  AppThemeColors get colors => appTheme.colors;

  AppThemeStyles get styles => appTheme.styles;
}

extension TextStyleExtension on TextStyle {
  TextStyle withHeight(double? height) => copyWith(height: height);

  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle withSize(double? size) => copyWith(fontSize: size);

  TextStyle withWeight(FontWeight? weight) => merge(TextStyle(fontWeight: weight));
}
