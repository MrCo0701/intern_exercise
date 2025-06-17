import 'package:flutter/material.dart';

class InformationCart extends StatelessWidget {
  const InformationCart({super.key, required this.category, required this.information});

  final String category;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'Detail information about ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
              TextSpan(text: category, style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(information),
      ],
    );
  }
}
