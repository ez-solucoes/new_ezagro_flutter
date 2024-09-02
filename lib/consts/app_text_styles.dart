import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/consts/app_dimens.dart';
import 'package:new_ezagro_flutter/consts/app_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle labelTextFieldStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontSize: 12,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle labelTextButtonStyle({
    required Color color,
  }) {
    return TextStyle(
        fontFamily: AppFonts.montserratFont,
        fontSize: 14,
        color: color,
        fontWeight: FontWeight.bold);
  }

  static TextStyle underlinedTextButtonStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: color,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.blackColor,
      decorationThickness: 2.0,
    );
  }

  static TextStyle titleTextStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.titleDimen,
      color: color,
    );
  }

  static TextStyle subTitleTextStyle({
    required Color color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: color,
    );
  }

  static TextStyle bodyTextStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w500,
      fontSize: AppDimens.bodyTextDimen,
      color: color,
    );
  }

  static TextStyle boldTextOnCardStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.bold,
      fontSize: AppDimens.textOnCard,
      color: color,
    );
  }

  static TextStyle smallBoldTextOnCardStyle({
    required Color color,
  }) {
    return TextStyle(
        fontFamily: AppFonts.montserratFont,
        fontWeight: FontWeight.bold,
        fontSize: AppDimens.smallTextDimen,
        color: color
    );
  }

  static TextStyle labelOnCardStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w500,
      fontSize: AppDimens.labelOnCard,
      color: color,
    );
  }

  static TextStyle appBarTitleTextStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w600,
      fontSize: AppDimens.smallTextDimen,
      color: color,
    );
  }

  static TextStyle appBarSubTitleTextStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.smallTextDimen,
      color: color,
    );
  }

  static TextStyle bigBoldCellTitle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.bold,
      fontSize: AppDimens.subTitleDimen,
      color: color
    );
  }

  static TextStyle cellBodyTextStyle({
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.montserratFont,
      fontWeight: FontWeight.w500,
      fontSize: AppDimens.smallTextDimen,
      color: color,
    );
  }

}
