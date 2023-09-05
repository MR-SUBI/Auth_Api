import 'package:auth_api/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterApp extends StatefulWidget {
  final Function()? onTap;
  const RegisterApp({super.key,required this.onTap});

  @override
  State<RegisterApp> createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _conforController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Text(
                'Welcome',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'To Auth_App',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Center(
              child: Image.asset(
                'assets/welcome.png',
                height: 250,
                width: 250,
              ),
            ),
            Text(
              'Create New Account',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: "Email",
                        hintStyle: GoogleFonts.poppins(color: Colors.black)),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            //password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: GoogleFonts.poppins(color: Colors.black)),
                  ),
                ),
              ),
            ),
            //gap

            const SizedBox(
              height: 15,
            ),
            //password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _conforController,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: "Conform - Password",
                        hintStyle: GoogleFonts.poppins(color: Colors.black)),
                  ),
                  
                ),
              ),
              
            ),
            SizedBox(height: 20,),
             Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //login button
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //forget your password?

                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                            
                             'Already have an Account?'),
                      ),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ), // Background color
                              ),
                              onPressed: () {
                                 RegisterMethod();
                                // login(emaiLController.text.toString(),
                                //     passwordController.text.toString( ));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(fontSize: 22),
                              ))),
                    ],
                  ),
                ),
          ]),
        ),
      ),
    );
  }
  
  void RegisterMethod() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
        //check password
      if(_passController.text == _conforController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        wrongPass();
      }
    }
  }

  void wrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('NO User Found'),
          );
        });
  }

  void wrongPass() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Password'),
          );
        });
  
  }
}
