import 'package:auth_api/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Auth());
}
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}