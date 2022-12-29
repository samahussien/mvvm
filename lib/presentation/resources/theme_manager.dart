

import 'color_manager.dart';
import 'style_manager.dart';
import 'package:flutter/material.dart';

import 'fonts_manager.dart';
import 'value_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary, //ripple effect color
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
      appBarTheme: AppBarTheme(
          color: ColorManager.primary,
          centerTitle: true,
          elevation: AppSize.s4,
          shadowColor: ColorManager.lightPrimary,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSize.s17),
              backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16),
          headlineLarge: getRegularStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          headlineMedium:getRegularStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s14) ,
          titleMedium: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s16),
          bodyLarge: getRegularStyle(color: ColorManager.grey1),
          bodySmall: getRegularStyle(color: ColorManager.grey)),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        labelStyle:
            getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.grey,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.error,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
