import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:new_ezagro_flutter/app_modules/app_module.dart';
import 'package:new_ezagro_flutter/app_widget.dart';
import 'package:new_ezagro_flutter/core/config/environment_config.dart';
import 'package:new_ezagro_flutter/firebase_options.dart';
import 'package:new_ezagro_flutter/core/services/fcm_service.dart';

import 'features/presenter/widgets/errors/flutter_error_widget.dart';

// Handle background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(FlutterErrorWidget(details));
  };

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set up Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Request notification permissions (iOS)
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('✅ User granted permission for notifications');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('⚠️ User granted provisional permission');
  } else {
    print('❌ User declined or has not accepted permission');
  }

  // Initialize FCM Service (token will be retrieved later)
  await FCMService().initialize();

  // 🔍 Safe Environment Debug (only in development)
  if (EnvironmentConfig.isDevelopment) {
    print('🌱 Ez Agro Environment: ${EnvironmentConfig.isDevelopment ? "Development" : "Production"}');
    print('🌐 API URL: ${EnvironmentConfig.apiUrl}');
  }

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
