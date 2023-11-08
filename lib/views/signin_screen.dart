import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/views/signup_screen.dart';
import 'package:todo_list_app/utils/color_utils.dart';

import '../reusable_widgets/reusable_widgets.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: hexStringToColor("#E1999F"),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/images/logo.webp"),
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField("Enter Your Email","Eter your Email" ,Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Your Password",'Enter your Password' ,Icons.lock_outline, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableButton(context, "Log In ", () {
                      if (_formKey.currentState!.validate())
                      {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text).then((value) {
                        login =true;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen(loginState: login,)));
                      })//.onError((error, stackTrace) {AlertDialog(title: Text('Wrong email or password',));})
                       ;}},
                        MediaQuery.of(context).size.width, 50,16),
                    richText(
                        4,
                        ["Do not have an account? ", "Sign Up"," or ", "Skip"],
                        [
                              (){},
                              (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));},
                              (){},
                              (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(loginState: login,)));}
                        ]
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
