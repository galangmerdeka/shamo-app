// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

Widget TextFieldWidget(
  BuildContext context, {
  bool colorFieldFill = true,
  required String hintText,
  IconData? iconField = null,
  required bool obsText,
  required TextEditingController textController,
  String? Function(String?)? validatorField,
}) {
  return TextFormField(
    validator: validatorField,
    obscureText: obsText,
    controller: textController,
    style: primaryTextStyle,
    decoration: InputDecoration(
      filled: colorFieldFill,
      hintText: hintText,
      hintStyle: TextStyle(color: secondaryTextColor),
      fillColor: bgColor3,
      prefixIcon: Icon(
        iconField,
        color: primaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
    ),
  );
}
