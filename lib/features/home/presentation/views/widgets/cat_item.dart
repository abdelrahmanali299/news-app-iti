import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  const CatItem({super.key, required this.isSelected, required this.title});
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffFFA500) : Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }
}
