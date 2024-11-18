import 'package:flutter/material.dart';

class FlutterErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const FlutterErrorWidget(this.errorDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Error',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text(
            'Some error get caught ${errorDetails.exceptionAsString()}',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
