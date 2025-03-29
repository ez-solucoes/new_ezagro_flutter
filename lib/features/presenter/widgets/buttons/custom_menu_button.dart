import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';
import 'package:new_ezagro_flutter/design_system/typography/app_text_styles.dart';

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final dynamic icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlackColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(), // Chama a função para construir o ícone
            const SizedBox(width: 36),
            Text(
              title,
              style: AppTextStyles.labelTextButtonStyle(color: AppColors.primaryWhiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (icon is IconData) {
      return Icon(
        icon,
        color: AppColors.primaryWhiteColor,
      );
    } else if (icon is SvgPicture) {
      return icon;
    } else {
      return const SizedBox.shrink();
    }
  }
}