import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FCMService {
  static final FCMService _instance = FCMService._internal();
  factory FCMService() => _instance;
  FCMService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Initialize FCM service
  Future<void> initialize() async {
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Handle notification taps when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
    
    // Check if app was opened from a notification
    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }

    // Get FCM token after a delay to ensure APNS is ready
    _getTokenSafely();

    // Listen for token refresh
    _firebaseMessaging.onTokenRefresh.listen((token) {
      print('🔄 FCM Token refreshed: $token');
      _sendTokenToServer(token);
    });
  }

  /// Handle messages when app is in foreground
  void _handleForegroundMessage(RemoteMessage message) {
    print('📨 Foreground message received: ${message.notification?.title}');
    
    // Show in-app notification or handle the message
    if (message.notification != null) {
      _showInAppNotification(message);
    }
    
    // Process any data payload
    if (message.data.isNotEmpty) {
      _processMessageData(message.data);
    }
  }

  /// Handle notification tap when app is in background
  void _handleMessageOpenedApp(RemoteMessage message) {
    print('🔔 Notification tapped: ${message.notification?.title}');
    
    // Navigate to specific screen based on message data
    if (message.data.isNotEmpty) {
      _processMessageData(message.data);
    }
  }

  /// Show in-app notification (you can customize this)
  void _showInAppNotification(RemoteMessage message) {
    // You can implement a custom in-app notification here
    // For now, we'll just print the notification
    print('🔔 ${message.notification?.title}');
    print('📝 ${message.notification?.body}');
  }

  /// Process message data payload
  void _processMessageData(Map<String, dynamic> data) {
    print('📊 Message data: $data');
    
    // Handle different types of messages based on data
    String? type = data['type'];
    switch (type) {
      case 'alert':
        _handleAlertMessage(data);
        break;
      case 'update':
        _handleUpdateMessage(data);
        break;
      case 'navigation':
        _handleNavigationMessage(data);
        break;
      default:
        print('Unknown message type: $type');
    }
  }

  /// Handle alert type messages
  void _handleAlertMessage(Map<String, dynamic> data) {
    print('⚠️ Alert message received');
    // Implement alert handling logic
  }

  /// Handle update type messages
  void _handleUpdateMessage(Map<String, dynamic> data) {
    print('🔄 Update message received');
    // Implement update handling logic
  }

  /// Handle navigation type messages
  void _handleNavigationMessage(Map<String, dynamic> data) {
    print('🧭 Navigation message received');
    // Implement navigation logic
    String? route = data['route'];
    if (route != null) {
      // Navigate to specific route
      print('Navigate to: $route');
    }
  }

  /// Safely get FCM token after APNS is ready
  Future<void> _getTokenSafely() async {
    print('🔍 Attempting to get FCM token...');
    
    try {
      // Wait a bit to ensure APNS token is available
      await Future.delayed(const Duration(seconds: 3));
      
      print('📋 Checking notification authorization status...');
      NotificationSettings settings = await _firebaseMessaging.requestPermission();
      print('🔐 Authorization status: ${settings.authorizationStatus}');
      
      // Check if APNS token is available (iOS only)
      print('🍎 Checking APNS token availability...');
      String? apnsToken = await _firebaseMessaging.getAPNSToken();
      
      if (apnsToken == null) {
        print('⚠️ APNS token not available yet, retrying in 10 seconds...');
        // Retry after another delay
        Future.delayed(const Duration(seconds: 10), () => _getTokenSafely());
        return;
      }
      
      print('🍎 APNS Token available: ${apnsToken.substring(0, 20)}...');
      
      print('📱 Attempting to get FCM token...');
      String? token = await _firebaseMessaging.getToken();
      
      if (token != null) {
        print('✅ SUCCESS! FCM Token: ${token.substring(0, 20)}...');
        print('🍎 APNS Token: ${apnsToken.substring(0, 20)}...');
        // Send token to your backend server
        await _sendTokenToServer(token);
      } else {
        print('⚠️ FCM Token is null, will retry in 10 seconds...');
        // Retry after another delay
        Future.delayed(const Duration(seconds: 10), () => _getTokenSafely());
      }
    } catch (e) {
      print('❌ Error getting FCM token: $e');
      print('🔄 Will retry in 15 seconds...');
      // Retry after a delay
      Future.delayed(const Duration(seconds: 15), () => _getTokenSafely());
    }
  }

  /// Get FCM token
  Future<String?> getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      print('📱 FCM Token: $token');
      return token;
    } catch (e) {
      print('❌ Error getting FCM token: $e');
      return null;
    }
  }

  /// Subscribe to a topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
      print('✅ Subscribed to topic: $topic');
    } catch (e) {
      print('❌ Error subscribing to topic $topic: $e');
    }
  }

  /// Unsubscribe from a topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      print('✅ Unsubscribed from topic: $topic');
    } catch (e) {
      print('❌ Error unsubscribing from topic $topic: $e');
    }
  }

  /// Update token (call this when user logs in/out)
  Future<void> updateToken() async {
    String? token = await getToken();
    if (token != null) {
      // Send token to your backend server
      await _sendTokenToServer(token);
    }
  }

  /// Send token to your backend server
  Future<void> _sendTokenToServer(String token) async {
    try {
      // TODO: Implement API call to send token to your backend
      print('📤 Sending token to server: $token');
      
      // Example API call:
      // await yourApiService.updateDeviceToken(token);
      
    } catch (e) {
      print('❌ Error sending token to server: $e');
    }
  }

  /// Delete token (call this when user logs out)
  Future<void> deleteToken() async {
    try {
      await _firebaseMessaging.deleteToken();
      print('🗑️ FCM token deleted');
    } catch (e) {
      print('❌ Error deleting FCM token: $e');
    }
  }
}
