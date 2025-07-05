import 'package:flutter/material.dart';

SnackBar SnackBarCustom(String content, Color backgroundColor) {
  return SnackBar(
    padding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(
      content,
      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
  );
}
