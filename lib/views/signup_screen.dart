
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/views/signin_screen.dart';
import '../reusable_widgets/reusable_widgets.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool login = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: hexStringToColor("#E1999F"),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter UserName *", "username is required",Icons.person_outline,
                        false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email ID *", "Email is required", Icons.email, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password *","Password is required" ,Icons.lock_outline, true,
                        _passwordTextController),

                    const SizedBox(
                      height: 20,
                    ),
                    reusableButton(context, "Sign UP", () {
                      if(_formKey.currentState!.validate()){
                        FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        login = true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(loginState: login,)));
                      })
                      //.onError((error, stackTrace) {print('Error ${error.toString()}');})
                          ;}

                    }, MediaQuery.of(context).size.width, 50,16),
                   richText(
                       4,
                       ["Already have an account? ","Sign in"," Or ", "Skip"],
                       [(){},
                             (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));},
                             (){},
                             (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(loginState: login,)));}])
                   //skipOption()
                  ],
                ),
              ),
            ),
          )),
    );
  }



}
