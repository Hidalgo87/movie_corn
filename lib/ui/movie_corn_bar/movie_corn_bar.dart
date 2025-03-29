import 'package:flutter/material.dart';
import 'package:movie_corn/ui/movie_corn_bar/profile_icon.dart';

class MovieCornBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLogged;
  final Color backgroundColor;

  const MovieCornBar({
    super.key,
    required this.title,
    this.isLogged = true,
    this.backgroundColor = const Color.fromARGB(255, 255, 176, 1),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      actions: isLogged ? [ProfileIcon()] : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
