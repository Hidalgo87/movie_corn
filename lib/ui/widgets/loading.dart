import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 180,
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 224, 5, 1),
              ),
            ),
            SizedBox(
              width: 170,
              child: CircleAvatar(
                radius: 68, // Tamaño del círculo
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
