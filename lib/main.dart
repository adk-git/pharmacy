import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharmacy/src/ui/main/main_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(platform: TargetPlatform.iOS),
      home: const MainScreen(),
    ),
  );
}
