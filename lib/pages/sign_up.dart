import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_act/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isObsecure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/image3.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SIGN UP HERE',
                    style: GoogleFonts.aladin(
                        fontSize: 45,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //textfield for email
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.grey.withOpacity(0.4),
                        filled: true,
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Textfield for password
                  TextField(
                    controller: _passwordController,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: isObsecure == false
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey.shade700,
                                ),
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                        ),
                        hintText: 'Password',
                        fillColor: Colors.grey.withOpacity(0.4),
                        filled: true,
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //signup button
                  GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
