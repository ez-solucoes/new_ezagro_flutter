import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/core/config/environment_config.dart';

/// Debug widget to display current environment configuration
/// Add this to your app during development to verify environment setup
class EnvironmentDebugWidget extends StatelessWidget {
  const EnvironmentDebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final envInfo = EnvironmentConfig.environmentInfo;
    
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🔧 Environment Configuration',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...envInfo.entries.map((entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  TextSpan(
                    text: '${entry.key}: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${entry.value}',
                    style: TextStyle(
                      color: entry.key == 'apiUrl' 
                        ? (entry.value.toString().contains('dev') ? Colors.orange : Colors.green)
                        : null,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

/// Extension to easily add environment info to any page during development
extension EnvironmentDebugging on Widget {
  Widget withEnvironmentDebug() {
    return Column(
      children: [
        const EnvironmentDebugWidget(),
        Expanded(child: this),
      ],
    );
  }
}
