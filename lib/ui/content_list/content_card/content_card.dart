import 'package:flutter/material.dart';
import 'package:movie_corn/domain/model/content.dart';
import 'package:movie_corn/ui/content_detail/content_detail_screen.dart';

class ContentCard extends StatelessWidget {
  final Content content;

  const ContentCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundImage:
            content.poster == 'N/A'
                ? AssetImage('assets/logo.jpg')
                : NetworkImage(content.poster),
      ),
      title: Text(content.title, style: TextStyle(fontSize: 19.0)),
      subtitle: Text(
        content.year.toString(),
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      trailing: Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentDetailScreen(content: content),
          ),
        );
      },
    );
  }
}
