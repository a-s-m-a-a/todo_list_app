import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/reusable_widgets/reusable_widgets.dart';
import 'package:todo_list_app/view_model/app_view_model.dart';
import 'package:todo_list_app/views/dash_board_screen.dart';
import 'package:todo_list_app/views/profile_screen.dart';
import 'package:todo_list_app/views/signin_screen.dart';
import 'package:todo_list_app/utils/color_utils.dart';
import 'package:todo_list_app/views/signup_screen.dart';

class HeaderView extends StatelessWidget {
  final bool login;
  const HeaderView({required this.login,super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return login? AppBar(
        backgroundColor: hexStringToColor("#663635"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: hexStringToColor("#E1999F"),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DashBoardScreen()));

            },
            child: Text("D", style: TextStyle(color: hexStringToColor("#663635"), fontWeight: FontWeight.bold, ),),),
        ),
        title: Padding(
          padding: const EdgeInsets.all(15),
          child: richText(
              2,
              ["Hello, ", viewModel.username],
              [(){},(){Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileScreen()));}]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hexStringToColor("#E1999F"),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()));
                });
              },
              child: Text(" Log Out", style: TextStyle(color: hexStringToColor("#F9F1F0")),),),
          ),
        ],
      )
          :AppBar(
            backgroundColor: hexStringToColor("#663635"),
            leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: hexStringToColor("#E1999F"),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DashBoardScreen()));

            },
            child:  Text("D",
              style: TextStyle(color: hexStringToColor("#F9F1F0"), fontWeight: FontWeight.bold,fontSize: 20, ),
            ),),
        ),
            title:  Text("Welcome, sign in to get your profile", style: TextStyle(color: hexStringToColor("#F9F1F0"))),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexStringToColor("#E1999F"),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()));
                    });

                  },
                  child: const Text("Log in ", style: TextStyle(color: Colors.white),),),
              ),
               Text("|", style: TextStyle(color: hexStringToColor("#F9F1F0"),fontWeight: FontWeight.bold,fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hexStringToColor("#E1999F"),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    });

                  },
                  child: Text("Sign up", style: TextStyle(color: hexStringToColor("#F9F1F0")),),),
              ),
        ],
      );
    });

  }
}
