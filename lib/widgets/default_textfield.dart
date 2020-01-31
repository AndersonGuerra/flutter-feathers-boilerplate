import 'package:flutter/material.dart';

class DefaultTextField extends TextField {
  DefaultTextField(
    {Function(String) onChanged, IconData icon, bool isHidden: false, 
    TextEditingController controller, dynamic maxLines}
  ) : super(
    controller: controller,
    maxLines: isHidden ? 1 : maxLines,
    onChanged: onChanged,
    obscureText: isHidden,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      )
    ),);
}