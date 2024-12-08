import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String imagePath;

  const BookImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight / 3, // Limit height to 1/3 of the screen
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Ensures the image scales proportionally
      ),
    );
  }
}
