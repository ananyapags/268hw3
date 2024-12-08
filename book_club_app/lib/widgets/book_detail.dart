import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_image.dart';
import '../widgets/shared_app_bar.dart'; // Import the SharedAppBar widget

class BookDetail extends StatelessWidget {
  final Book book;

  const BookDetail({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookImage(imagePath: book.imagePath), // Use updated widget
            SizedBox(height: 16),
            Text(book.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("by ${book.author}",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            SizedBox(height: 16),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}
