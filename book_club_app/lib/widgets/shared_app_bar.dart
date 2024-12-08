import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  const SharedAppBar({required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Color.fromARGB(57, 187, 148, 229),
      leading: leading ??
          IconButton(
            icon: Icon(Icons.menu), // Default tribar icon
            onPressed: () {},
          ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle), // Profile icon
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
