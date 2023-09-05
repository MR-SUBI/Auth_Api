import 'package:auth_api/auth_page.dart';
import 'package:auth_api/register/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
);
  runApp(const Auth());
}
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AuthPage(),
    );
  }
}