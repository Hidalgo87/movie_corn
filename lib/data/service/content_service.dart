import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_corn/domain/model/content.dart';

class ContentService {
  Future<List<Content>> getContentsByName(String contentName) async {
    final url = Uri.https('https://www.omdbapi.com', '/', {
      'apikey': '118f3b2',
      's': contentName,
    });
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> listOfJson = jsonDecode(response.body)['Search'];
        final movieList =
            listOfJson.map((json) => Content.fromJson(json)).toList();
        return movieList;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Failed to load content');
    }
  }
}
