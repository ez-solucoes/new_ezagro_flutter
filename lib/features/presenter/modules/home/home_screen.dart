import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_routes.dart';

class HomeScreen extends StatelessWidget {
  static const String routePath = AppRoutes.appHomeScreen;

  static void navigate() => Modular.to.navigate(routePath);

  static Future<Object?> push() => Modular.to.pushNamed(routePath);

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
