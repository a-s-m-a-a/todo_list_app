import 'package:flutter/material.dart';
import 'package:todo_list_app/reusable_widgets/reusable_widgets.dart';

import '../utils/color_utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexStringToColor("#663635"),
        title: Text("Profile",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("#F79489"),
                hexStringToColor("#F9F1F0"),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Container(
              padding:const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: logoWidget("assets/images/profileImage.JPG"),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text("Asmaa Ahmed", style: Theme.of(context).textTheme.headlineMedium,),
                  Text("aa2025716@gmail.com", style: Theme.of(context).textTheme.bodyMedium,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
