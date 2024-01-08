import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SquareTile({Key? key, required this.imagePath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, // Adjust the width as needed
        height: 50, // Adjust the height as needed
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
