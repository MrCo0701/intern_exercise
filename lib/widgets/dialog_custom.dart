import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogCustom extends StatelessWidget {
  const DialogCustom({super.key, required this.title, required this.onClickNo, required this.onClickYes});

  final String title;
  final VoidCallback onClickNo;
  final VoidCallback onClickYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(40)),
      child: Container(
        height: 170,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.question_mark),
            SizedBox(height: 10),
            Text(title),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: onClickNo, child: Text('No')),
                SizedBox(width: 30),
                ElevatedButton(onPressed: onClickYes, child: Text('Yes')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
