import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/views/task_list_view.dart';
import '../utils/color_utils.dart';
import '../view_model/app_view_model.dart';
import 'add_task_view.dart';
import 'header_view.dart';

class HomeScreen extends StatelessWidget {
  final bool loginState;
  const HomeScreen({ required this.loginState, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          child: Column(
            children: [
              Expanded(flex: 1, child: HeaderView(login: loginState,)),
              const Expanded(flex:7, child: TaskListView()),
            ],
          ),
        ),
      ),

      floatingActionButton: const AddTaskView(),
    );
  });
}
}