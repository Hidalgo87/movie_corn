import 'package:flutter/material.dart';
import 'package:movie_corn/data/service/content_service.dart';
import 'package:movie_corn/domain/model/content.dart';
import 'package:movie_corn/ui/content_list/content_card/content_card.dart';
import 'package:movie_corn/ui/widgets/empty_state.dart';
import 'package:movie_corn/ui/widgets/loading.dart';

class ContentListScreen extends StatefulWidget {
  const ContentListScreen({super.key});

  @override
  State<ContentListScreen> createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  List<Content> _contentList = [];
  bool _isLoading = false;

  final ContentService _contentService = ContentService();

  Future<void> _fetchContentList() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 2));
      final contentList = await _contentService.fetchContentsByName('nemo');
      setState(() {
        _contentList = contentList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load content'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchContentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content List',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 255, 186, 36),
      ),
      body: SafeArea(
        child:
            _isLoading
                ? Loading()
                : _contentList.isEmpty
                ? EmptyState()
                : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [_search(), _showContentList()],
                  ),
                ),
      ),
    );
  }

  _search() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
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
          return ContentCard(
            content: _contentList[index],
          );
        },
      ),
    );
  }
}
