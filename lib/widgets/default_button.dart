import 'package:flutter/material.dart';

class DefaultButton extends MaterialButton {
  DefaultButton(
    {String title,
    Function onPressed, 
    double minWidth: 100}
  ) : super(
    padding: EdgeInsets.all(20.0),
    minWidth: minWidth!=null ? minWidth : double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: Colors.purple,
    child: Text(title, style: TextStyle(color: Colors.white),), 
    onPressed: onPressed,
  );
}