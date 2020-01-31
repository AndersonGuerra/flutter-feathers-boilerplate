import 'package:flutter/material.dart';

class DefaultTextField extends TextField {
  DefaultTextField(
    {Function(String) onChanged, IconData icon, bool isHidden: false, 
    TextEditingController controller}
  ) : super(
    controller: controller,
    onChanged: onChanged,
    obscureText: isHidden,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(icon) != null ? Icon(icon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      )
    ),);
}