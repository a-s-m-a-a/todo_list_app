import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/reusable_widgets/reusable_widgets.dart';
import 'package:todo_list_app/view_model/app_view_model.dart';

import '../../utils/color_utils.dart';

class EditTaskBottomSheetView extends StatelessWidget {
  final int currentIndex;
  final String currentTitle;
  const EditTaskBottomSheetView(
      {required this.currentTitle, required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editingController = TextEditingController();
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 120,
          child: Center(
            child: SizedBox(
              height: 100,
              width: 250,
              child: Column(
                children: [
                  TextField(
                    onSubmitted: (valu) {
                      if (editingController.text.isNotEmpty &&
                          editingController.text != currentTitle) {
                        viewModel.editTaskTitle(
                            editingController.text, currentIndex);
                        editingController.clear();
                      }
                      Navigator.of(context).pop();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      filled: true,
                      fillColor: hexStringToColor("#DEB3AD"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                      hintText: currentTitle,
                      hintStyle: TextStyle(color: hexStringToColor('#663635'),),
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.black,
                    autofocus: true,
                    autocorrect: false,
                    style:  TextStyle(color: hexStringToColor('#663635'), fontWeight: FontWeight.w500),
                    controller: editingController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reusableButton(context, "Cancel", () {
                        Navigator.of(context).pop();
                      }, 100.0, 20.0, 10),
                      const Spacer(),
                      reusableButton(context, "Update", () {
                        if (editingController.text.isNotEmpty &&
                            editingController.text != currentTitle) {
                          viewModel.editTaskTitle(
                              editingController.text, currentIndex);
                          editingController.clear();
                        }
                        Navigator.of(context).pop();
                      }, 100, 20, 10)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
