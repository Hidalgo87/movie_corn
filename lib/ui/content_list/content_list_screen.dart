import 'package:flutter/material.dart';
import 'package:movie_corn/data/service/content_service.dart';
import 'package:movie_corn/domain/model/content.dart';
import 'package:movie_corn/ui/content_list/content_card/content_card.dart';
import 'package:movie_corn/ui/widgets/empty_state.dart';
import 'package:movie_corn/ui/widgets/loading.dart';
import 'package:movie_corn/ui/movie_corn_bar/movie_corn_bar.dart';

class ContentListScreen extends StatefulWidget {
  const ContentListScreen({super.key});

  @override
  State<ContentListScreen> createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  List<Content> _contentList = [];
  bool _isLoading = false;

  final ContentService _contentService = ContentService();

  Future<void> _fetchContentList(String title) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 2));
      final contentList = await _contentService.fetchContentsByName(title);
      setState(() {
        _contentList = contentList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchContentList('dark');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MovieCornBar(title: 'Content List'),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _search(),
              _isLoading
                  ? Loading()
                  : _contentList.isEmpty
                  ? EmptyState()
                  : _showContentList(),
            ],
          ),
        ),
      ),
    );
  }

  _search() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onSubmitted: (value) {
          _fetchContentList(value);
        },
        decoration: InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          prefixIcon: Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.black, width: 2.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  _showContentList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _contentList.length,
        itemBuilder: (context, index) {
          return ContentCard(content: _contentList[index]);
        },
      ),
    );
  }
}
