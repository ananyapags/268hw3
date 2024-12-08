import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/book_cubit.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => BookCubit()..initBooks(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
