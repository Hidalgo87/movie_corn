import 'package:flutter/material.dart';
import 'package:movie_corn/ui/profile_edit/profile_edit_screen.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
        iconSize: 40,
        icon: const Icon(
          Icons.account_circle,
          color: Color.fromARGB(255, 120, 7, 2),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileEditScreen()),
          );
        },
      ),
    );
  }
}
