import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final TextStyle unselectedCategory = new TextStyle(fontSize: 16.0, color: Colors.grey);
  final TextStyle selectedCategory = new TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black);
    final String value;

  CategoryWidget({@required this.title, this.value, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        title,
        style: isSelected? selectedCategory: unselectedCategory,
      ),
    );
  }
}
