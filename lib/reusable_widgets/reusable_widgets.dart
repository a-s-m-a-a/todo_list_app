import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:todo_list_app/utils/color_utils.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

TextFormField reusableTextField(String text,String validateText, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validateText;
      }
      return null;
    },
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: hexStringToColor('#663635'),
    style: TextStyle(color: hexStringToColor('#663635').withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: hexStringToColor('#663635'),
        ),
        labelText: text,
        labelStyle: TextStyle(color: hexStringToColor('#663635')),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: hexStringToColor("#F9F1F0"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container reusableButton(BuildContext context, String text, Function onTap,
    double width, double height, double fontSize) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return hexStringToColor("#663635");
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        "$text",
        style: TextStyle(
            color: hexStringToColor("#F9F1F0"),
            fontWeight: FontWeight.bold,
            fontSize: fontSize),
      ),
    ),
  );
}

Container reusableTextBox(
    String text, Color color, double width, double height) {
  return Container(
    alignment: Alignment.center,
    width: width,
    height: height,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    child: Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          backgroundColor: Colors.transparent),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

// return RichText num => number of sections in text line , text => List of sections in text line, function=> to navigate between pages
// ex: richText( 2,[ "hello, ", "asmaa" ], [any widget with no return, ProfileScreen()] ) ------ "asmaa" will be underline and clickable and deferent color
RichText richText(int num, List<String> text, List<Function> function) {
  List<Color> color = [
    hexStringToColor("#AA1945"),
    hexStringToColor("#F9F1F0"),
    hexStringToColor("#AA1945"),
    hexStringToColor("#F9F1F0"),
    hexStringToColor("#AA1945"),
    hexStringToColor("#F9F1F0"),
  ];
  List<bool> isUnderLine = [false, true, false, true, false, true];
  return RichText(
      text: TextSpan(children: <TextSpan>[
    for (int i = 0; i < num; i++)
      TextSpan(
          text: text[i],
          style: TextStyle(
              color: color[i],
              decoration: isUnderLine[i]
                  ? TextDecoration.underline
                  : TextDecoration.none,
              fontSize: 18,
              fontStyle: FontStyle.italic),
          recognizer: TapGestureRecognizer()
            ..onTap = function[i] as GestureTapCallback?),
  ]));
}
