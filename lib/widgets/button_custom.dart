import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.title,
    required this.canClick,
    required this.onPressed,
  });

  final String title;
  final bool canClick;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: canClick ? onPressed : (){},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: canClick ? Colors.green : Colors.grey,
        ),
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
