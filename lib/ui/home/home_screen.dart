import 'package:flutter/material.dart';
import 'package:movie_corn/ui/home/content_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _gradientBackground(),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child: SizedBox(
                      width: 150,
                      child: CircleAvatar(
                        radius: 59, // Tamaño del círculo
                        backgroundImage: AssetImage('assets/logo.jpg'),
                      ),
                    ),
                  ),
                  _homeButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _gradientBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 0.9,
          colors: [
            Color.fromARGB(254, 224, 5, 1),
            Color.fromARGB(255, 120, 7, 2),
          ],
          stops: [0.2, 1],
        ),
      ),
    );
  }

  _homeButton(context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContentListScreen()),
        );
      },
      icon: Icon(Icons.movie, color: Colors.black),
      label: Text(
        'Let´s Corn',
        style: TextStyle(
          fontSize: 20,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 186, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ), // Tamaño del botón
      ),
    );
  }
}
