import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget.child!));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("#F79489"),
              hexStringToColor("#F9F1F0"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child:  Center(
          child: Text(
            "Welcome To Your ToDo list Application",
            style: TextStyle(color: hexStringToColor("#663635"), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
