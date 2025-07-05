import 'package:flutter/material.dart';

class DropDownTitle extends StatelessWidget {
  const DropDownTitle({super.key, required this.onPress, required this.title, required this.description});

  final VoidCallback onPress;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 5),
              description != ''
                  ? Text(description, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
                  : Container(),
            ],
          ),
          IconButton(onPressed: onPress, icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 30)),
        ],
      ),
    );
  }
}
