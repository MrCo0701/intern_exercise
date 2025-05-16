import 'package:flutter/material.dart';

class TitleShop extends StatelessWidget {
  const TitleShop({super.key, required this.title, required this.onPress});

  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Spacer(),
        TextButton(
          style: ButtonStyle(),
          onPressed: onPress,
          child: Text(
            'See all',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
