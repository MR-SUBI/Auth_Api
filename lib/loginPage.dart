import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emaiLController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "PROJECT",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //img
                  Center(
                      child: Image.asset(
                    "assets/log1.png",
                    height: 350,
                    width: 350,
                  )),

                  //login text
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text('Login',
                        style: GoogleFonts.poppins(
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
                          controller: emaiLController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon:Icon(Icons.email,color: Colors.black,),
                              hintText: "Email",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.black)),
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
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              icon:Icon(Icons.lock,color: Colors.black,),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  //gap
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //login button
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //forget your password?

                        TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Your Password?')),
                        Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ), // Background color
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'LogIn',
                                  style: TextStyle(fontSize: 22),
                                ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
                    child: Column(
                      children: [
                        //hr line
                        const Divider(color: Colors.black),

                        //dont have an
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: [
                              Text(
                                'Dont Have an Account?',
                                style: GoogleFonts.poppins(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Register Now'))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
