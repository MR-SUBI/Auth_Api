import 'package:auth_api/HomePage.dart';
import 'package:auth_api/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder:(context, snapshot) {
              if(snapshot.hasData){
                return HomePage();
              } 
              else{
                return LoginPage();
              }
            }, 
            
            ));
  }
}
