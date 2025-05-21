import 'package:flutter/material.dart';

class TypeProductVertical extends StatelessWidget {
  const TypeProductVertical({
    super.key,
    required this.image,
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
  });

  final Image image;
  final String title;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(child: SizedBox(height: 120, child: image)),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
