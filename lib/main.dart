import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/app_module.dart';
import 'package:new_ezagro_flutter/app_widget.dart';

import 'features/presenter/widgets/errors/flutter_error_widget.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(FlutterErrorWidget(details));
  };

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
