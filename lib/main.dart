import 'package:apple_market_app/core/di/di.dart';
import 'package:apple_market_app/core/router/routers.dart';
import 'package:flutter/material.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
