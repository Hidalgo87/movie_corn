import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'No se encontraron resultados',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 80),
          SizedBox(
            width: 150,
            child: CircleAvatar(
              radius: 72, // Tamaño del círculo
              backgroundImage: NetworkImage(
                'https://www.shutterstock.com/image-vector/popcorn-striped-bucket-grains-fall-260nw-590344511.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
