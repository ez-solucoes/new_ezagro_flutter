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
    // Limpa quaisquer SnackBars anteriores para evitar sobreposição
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    switch (type) {
      case SnackBarType.error:
        return _buildErrorSnackBar(context, message);
      case SnackBarType.success:
        return _buildSuccessSnackBar(context, message);
      case SnackBarType.alert:
        return _buildAlertSnackBar(context, message);
    }
  }

  static _buildSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // <--- Envolvido o Text com Expanded
            child: Text(
              message,
              overflow: TextOverflow.ellipsis, // Adicionado para lidar com textos muito longos
            ),
          ),
          SizedBox(width: 8.0), // Espaço entre o texto e o ícone
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
          Expanded( // <--- Envolvido o Text com Expanded
            child: Text(
              message,
              overflow: TextOverflow.ellipsis, // Adicionado para lidar com textos muito longos
            ),
          ),
          SizedBox(width: 8.0), // Espaço entre o texto e o ícone
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
          Expanded( // <--- Envolvido o Text com Expanded
            child: Text(
              message,
              overflow: TextOverflow.ellipsis, // Adicionado para lidar com textos muito longos
            ),
          ),
          SizedBox(width: 8.0), // Espaço entre o texto e o ícone
          SvgPicture.asset(AppDrawables.warningWhiteIcon,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
        ],
      ),
      backgroundColor: AppColors.primaryYellowColor,
    ));
  }
}
