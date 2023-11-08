
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/utils/color_utils.dart';
import 'package:todo_list_app/views/bottom_sheets/edit_task_bottom_sheet_view.dart';
import '../view_model/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 15);
          },
          itemCount: viewModel.numTasks,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                viewModel.deleteTask(index);
              },
              background: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(Icons.delete),
                ),
              ),
              child:
              Container(
                decoration: BoxDecoration(
                  color: hexStringToColor("#AA1945"),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      side: const BorderSide(width: 2, color: Colors.white),
                      checkColor: Colors.yellowAccent,
                      activeColor: Colors.black26,
                      value: viewModel.getTaskValue(index),
                      onChanged: (value) {
                        viewModel.setTaskValue(index, value!);
                      },
                    ),
                    const SizedBox(width: 15,),
                    Text(
                      viewModel.getTaskTitle(index),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: viewModel.getTaskValue(index)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        color: Colors.yellowAccent,
                        iconSize: 18,
                        onPressed: () {
                          String text = viewModel.tasks[index].title.toString();
                          int x = index;
                          viewModel.bottomSheetBuilder( EditTaskBottomSheetView(currentTitle: text, currentIndex: x), context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        iconSize: 18,
                        onPressed: () {
                          viewModel.deleteTask(index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
