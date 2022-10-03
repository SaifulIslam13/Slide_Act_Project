import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_act/pages/sign_up.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback showSignupPage;
  const SignInPage({Key? key, required this.showSignupPage}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObsecure = true;

  //text controller

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  //sign in function
  Future signIn() async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //background image
      Image.asset(
        "images/image1.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon
                Icon(
                  Icons.android,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'SIGN IN HERE',
                  style: GoogleFonts.aladin(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
                SizedBox(
                  height: 50,
                ),
                //textfield for email
                TextFormField(
                  controller: _emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter email';
                    }
                  },
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
                //textfield for password
                TextFormField(
                  controller: _passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter password';
                    }
                  },
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
                //login button
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'SIGN IN',
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
                //signup button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Don't heve an account?",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.showSignupPage,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      )
    ]);
  }
}
