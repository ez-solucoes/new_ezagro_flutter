import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/features/presenter/documents_page/documents_page.dart';
import 'package:new_ezagro_flutter/features/presenter/register_page/register_fifth_step_page.dart';
import 'package:new_ezagro_flutter/features/presenter/register_page/register_fourth_step_page.dart';
import 'package:new_ezagro_flutter/features/presenter/register_page/register_second_step_page.dart';

import 'features/presenter/change_password_page/change_password_step_page.dart';
import 'features/presenter/login_page/login_page.dart';
import 'features/presenter/register_page/register_first_step_page.dart';
import 'features/presenter/register_page/register_third_step_page.dart';
import 'features/presenter/splash_page/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.appDefaultPage, child: (context) => const ChangePasswordStepPage());
    r.child(AppRoutes.appSplashPage, child: (context) => const SplashPage());
    r.child(AppRoutes.appHomePage, child: (context) => LoginPage());
    r.child(AppRoutes.appRegisterFirstStepPage, child: (context) => const RegisterFirstStepPage());
    r.child(AppRoutes.appRegisterSecondStepPage, child: (context) => const RegisterSecondStepPage());
    r.child(AppRoutes.appRegisterThirdStepPage, child: (context) => const RegisterThirdStepPage());
    r.child(AppRoutes.appRegisterFourthStepPage, child: (context) => const RegisterFourthStepPage());
    r.child(AppRoutes.appRegisterFifthStepPage, child: (context) => const RegisterFifthStepPage());
    r.child(AppRoutes.appDocumentsPage, child: (context) => const DocumentsPage());
    r.child(AppRoutes.appChangePasswordFirstStepPage, child: (context) => const ChangePasswordStepPage());
  }
}
