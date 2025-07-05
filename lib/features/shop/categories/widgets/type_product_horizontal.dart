import 'package:flutter/material.dart';

class TypeProductHorizontal extends StatelessWidget {
  const TypeProductHorizontal({super.key, required this.title, required this.assetImage, required this.backgroundColor});

  final String title;
  final String assetImage;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 110,
      width: 280,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Image.asset(assetImage)),
          SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
