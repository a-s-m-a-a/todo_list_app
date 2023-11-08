import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_model/app_view_model.dart';

import '../reusable_widgets/reusable_widgets.dart';
import '../utils/color_utils.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return viewModel.tasks.isNotEmpty
          ? Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: hexStringToColor("#663635"),
                title: Text("To Do Dashboard", style: TextStyle(color: hexStringToColor("#FADCD9")),),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        // textbox that takes text, color, width, height
                        reusableTextBox("Total Tasks ", hexStringToColor("#AA1945"), 300.0, 50.0),
                        const SizedBox(
                          height: 15,
                        ),
                        reusableTextBox(viewModel.tasks.length.toString(), hexStringToColor("#F79489"), 100.0, 50.0),
                        const SizedBox(
                          height: 15,
                        ),
                        reusableTextBox("Completed Tasks ", hexStringToColor("#AA1945"), 300.0, 50.0),
                        const SizedBox(
                          height: 15,
                        ),
                        reusableTextBox(viewModel.tasks.where((element) => element.complete).toList().length.toString(), hexStringToColor("#F79489"), 100.0, 50.0),
                        const SizedBox(
                          height: 15,
                        ),
                        reusableTextBox("Non-Completed Tasks ", hexStringToColor("#AA1945"), 300.0, 50.0),
                        const SizedBox(
                          height: 15,
                        ),
                        reusableTextBox(viewModel.tasks.where((element) => !element.complete).toList().length.toString(), hexStringToColor("#F79489"), 100.0, 50.0),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: hexStringToColor("#663635"),
                title: Text("To Do Dashboard", style: TextStyle(color: hexStringToColor("#FADCD9")),),
        ),
              body: SafeArea(
                bottom: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors:  [
                        hexStringToColor("#F79489"),
                        hexStringToColor("#F9F1F0"),
                      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: reusableTextBox("There is no Tasks ", hexStringToColor("#AA1945"), 300.0, 50.0),
                  ),
                ),
              ),
            );
    });
  }
}
