import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/design_system/colors/app_colors.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
      ),
      child: Text('Solicitações'),
    );
  }
}
