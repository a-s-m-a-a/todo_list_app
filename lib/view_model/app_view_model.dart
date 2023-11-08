import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("asmaa");

  int get numTasks => tasks.length;
  int get numTasksRemaining => tasks.where((task) => !task.complete).length;
  String get username => user.username;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  bool getTaskValue(int index) {
    return tasks[index].complete;
  }

  void setTaskValue(int index, bool taskValue) {
    tasks[index].complete = taskValue;
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  String getTaskTitle(int index) {
    return tasks[index].title;
  }

  void updateUserName(String newUserName) {
    user.username = newUserName;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTask() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }

  void editTaskTitle(String newTitle, int index) {
    tasks[index].title = newTitle;
    notifyListeners();
  }

}
