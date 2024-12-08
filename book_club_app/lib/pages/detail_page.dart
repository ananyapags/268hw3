import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_detail.dart';
import '../widgets/shared_app_bar.dart'; // Import the updated SharedAppBar

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Book Detail",
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to Home Page
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BookDetail(book: book),
      ),
    );
  }
}
