import 'package:auth_api/loginPage.dart';
import 'package:auth_api/register/register.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {

  bool showLogin = true;
  void togglepage(){
    setState(() {
    showLogin = !showLogin;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
if(showLogin){

  return LoginPage(
    onTap: togglepage
  );
}
else{
  return RegisterApp(
    onTap: togglepage,
  );
}
  }
}