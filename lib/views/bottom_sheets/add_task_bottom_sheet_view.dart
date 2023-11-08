import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../utils/color_utils.dart';
import '../../view_model/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 80,
          child: Center(
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                onSubmitted: (valu) {
                  if (entryController.text.isNotEmpty) {
                    Task newTask = Task(entryController.text);
                    viewModel.addTask(newTask);
                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                    hintText: "add new task",
                    hintStyle: TextStyle(color: hexStringToColor('#663635'),),
                    contentPadding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    filled: true,
                    fillColor: hexStringToColor("#DEB3AD"),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: hexStringToColor('#663635'),
                autofocus: true,
                autocorrect: false,
                controller: entryController,
                style:
                    TextStyle(color: hexStringToColor('#663635'), fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    });
  }
}
