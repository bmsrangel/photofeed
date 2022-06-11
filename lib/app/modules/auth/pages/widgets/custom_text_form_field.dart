import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    Key? key,
    required String labelText,
    super.obscureText,
    super.keyboardType,
    super.validator,
    super.controller,
    super.textInputAction,
  }) : super(
          key: key,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        );
}
