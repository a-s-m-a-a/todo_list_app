import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../view_model/app_view_model.dart';

class SettingBottomSheetView extends StatelessWidget {
  const SettingBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(builder:(context,viewModel, child){
      return Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 80,
          child: Center(
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                onSubmitted: (valu){
                  if(entryController.text.isNotEmpty){
                    viewModel.updateUserName(entryController.text);
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5,),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: Colors.white70,
                autofocus: true,
                autocorrect: false,
                controller: entryController,
                style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.w500),
              ),
            ),
          ), ),
      );
    });
  }
}
