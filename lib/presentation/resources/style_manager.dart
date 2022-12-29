
import 'package:first_application/presentation/resources/fonts_manager.dart';
import 'package:flutter/material.dart';
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontConstant.fontFamily,
      color: color);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12,required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}