import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/drawables/app_drawables.dart';

enum SnackBarType {
  success,
  error,
  alert,
}

class CustomSnackBarWidget {
  final SnackBarType type;
  final String message;
  final Color backgroundColor;
  final SvgPicture icon;

  CustomSnackBarWidget({
    required this.type,
    required this.message,
    required this.backgroundColor,
    required this.icon,
  });

  static show(SnackBarType type, BuildContext context, String message) {
    switch (type) {
      case SnackBarType.error:
        return _buildErrorSnackBar(context, message);
      case SnackBarType.success:
        return _buildSuccessSnackBar(context, message);
      case SnackBarType.alert:
        return _buildAlertSnackBar(context, message);
      default:
        throw Exception('SnackBar type not supported');
    }
  }

  static _buildSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          Spacer(),
          SvgPicture.asset(AppDrawables.checkWhiteIcon),
        ],
      ),
      backgroundColor: AppColors.primaryGreenColor,
    ));
  }

  static _buildErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          Spacer(),
          SvgPicture.asset(AppDrawables.closeWhiteIcon),
        ],
      ),
      backgroundColor: AppColors.primaryRedColor,
    ));
  }

  static _buildAlertSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          Spacer(),
          SvgPicture.asset(AppDrawables.warningWhiteIcon,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
        ],
      ),
      backgroundColor: AppColors.primaryYellowColor,
    ));
  }
}
