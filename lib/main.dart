import 'package:cinema_app/view/auth/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Bioskop',
      theme: ThemeData(
        primaryColor: const Color(0xFF1C1C28),
        backgroundColor: const Color(0xFF1C1C28),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
