import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/app_modules/app_module.dart';
import 'package:new_ezagro_flutter/app_widget.dart';
import 'package:new_ezagro_flutter/core/config/environment_config.dart';

import 'features/presenter/widgets/errors/flutter_error_widget.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(FlutterErrorWidget(details));
  };

  WidgetsFlutterBinding.ensureInitialized();

  // 🔍 Debug: Show current environment (remove this later)
  print('🌐 Ez Agro Environment: ${EnvironmentConfig.environmentInfo}');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
