import 'package:flutter/material.dart';

class DropDownItem extends StatelessWidget {
  const DropDownItem({super.key, required this.imageUrl, required this.title, this.onPressButton, this.onPressItem});

  final String imageUrl;
  final String title;
  final VoidCallback? onPressButton;
  final VoidCallback? onPressItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressItem,
      child: Container(
        width: onPressButton != null ? double.infinity : 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.green),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // * Image and Title
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(flex: 3, child: Image.asset(imageUrl, width: 40, height: 40)),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),

            // * Button
            onPressButton == null
                ? Container()
                : Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    onPressed: onPressButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Select', style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
