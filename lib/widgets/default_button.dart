import 'package:flutter/material.dart';

class DefaultButton extends MaterialButton {
  DefaultButton(
    {String title,
    Function onPressed, 
    double minWidth}
  ) : super(
    padding: EdgeInsets.all(20.0),
    minWidth: minWidth!=double.infinity ? minWidth : double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: Colors.purple,
    child: Text(title, style: TextStyle(color: Colors.white),), 
    onPressed: onPressed,
  );
}