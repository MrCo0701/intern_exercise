import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class VerticalProduct extends StatelessWidget {
  const VerticalProduct({
    super.key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.price,
  });

  final String assetImage;
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      padding: EdgeInsets.all(10),
      width: 180,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(assetImage),
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, overflow: TextOverflow.ellipsis),
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '\$$price',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Iconsax.add, color: Colors.white, size: 50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
