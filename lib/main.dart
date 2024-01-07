import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampletest/views/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

// -> Login and Signup using Getx and JSON API...

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
