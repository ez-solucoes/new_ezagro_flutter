class EnvironmentConfig {
  static const String _prodApiUrl = 'api.ezagro.com.br';
  static const String _devApiUrl = 'api.dev.temp.ezagro.com.br';
  static const String _scheme = 'https';

  // Environment detection
  static bool get isProduction {
    // Check if explicitly set to production
    const String? env = String.fromEnvironment('FLUTTER_ENV');
    if (env == 'production') return true;
    if (env == 'development') return false;
    
    // Default: use release mode detection
    // dart.vm.product is true in release builds, false in debug builds
    const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
    return kReleaseMode;
  }

  static bool get isDevelopment => !isProduction;

  static String get apiUrl {
    return isProduction ? _prodApiUrl : _devApiUrl;
  }

  static String get scheme => _scheme;

  static String get fullApiUrl => '$scheme://$apiUrl';

  // Helper method to get environment info for debugging
  static Map<String, dynamic> get environmentInfo => {
    'isProduction': isProduction,
    'isDevelopment': isDevelopment,
    'apiUrl': apiUrl,
    'fullApiUrl': fullApiUrl,
    'environment': String.fromEnvironment('FLUTTER_ENV', defaultValue: 'auto'),
    'releaseMode': bool.fromEnvironment('dart.vm.product'),
  };
}
