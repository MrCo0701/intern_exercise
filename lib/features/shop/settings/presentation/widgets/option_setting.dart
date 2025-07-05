import 'package:exercise_1/widgets/line.dart';
import 'package:flutter/material.dart';

class OptionSetting extends StatelessWidget {
  const OptionSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LineCustom(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(icon, size: 30),
                  SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.chevron_right, size: 30),
            ],
          ),
        ),
      ],
    );
  }
}
