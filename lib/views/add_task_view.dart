import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/views/bottom_sheets/add_task_bottom_sheet_view.dart';

import '../utils/color_utils.dart';
import '../view_model/app_view_model.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: hexStringToColor("#E1999F"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
          ),
          onPressed: (){
            viewModel.bottomSheetBuilder(const AddTaskBottomSheetView(), context);
          },
          child: Icon(
            Icons.add,
            size: 30,
            color: hexStringToColor("#F9F1F0"),
          ),),);
    },);
  }
}
