import 'package:flutter/material.dart';

TextField reUsableTextField(String text, IconData iconData, boolIsObscure,
    TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    obscureText: boolIsObscure,
    enableSuggestions: !boolIsObscure,
    autocorrect: !boolIsObscure,
    cursorColor: Colors.green,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: Colors.green,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: boolIsObscure
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
