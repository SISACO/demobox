import 'package:Donobox/screens/details/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: CupertinoSearchTextField(
          controller: _searchController,
          onChanged: (String value) {
            setState(() {
              // Perform search here
            });
          },
          onSubmitted: (String value) {
            setState(() {
              // Perform search here
            });
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('PostData').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }

    // Perform search
    var queryResults = snapshot.data!.docs.where((document) {
      // Filter based on search query
      String searchText = _searchController.text.toLowerCase();
      String postCommunity = document['PostCommunity'].toString().toLowerCase();
      String postDescription = document['PostDescription'].toString().toLowerCase();
      String postTitle = document['PostTitle'].toString().toLowerCase();

      return postCommunity.contains(searchText) ||
             postDescription.contains(searchText) ||
             postTitle.contains(searchText);
    }).toList();

    return ListView.builder(
      itemCount: queryResults.length,
      itemBuilder: (context, index) {
        DocumentSnapshot document = queryResults[index];
        String postId = document.id;


    String postDescription = document['PostDescription'].toString();
    String postTitle = document['PostTitle'].toString();

    // Highlight the search query in each field
    TextStyle highlightStyle = TextStyle(color: Colors.blue);
    List<InlineSpan> descriptionSpans = _getHighlightedSpans(postDescription, highlightStyle);
    List<InlineSpan> titleSpans = _getHighlightedSpans(postTitle, highlightStyle);


        
        // Display search result
        return ListTile(
          title: RichText(text: TextSpan(children: titleSpans)),
          subtitle: RichText(text: TextSpan(children: descriptionSpans)),
          onTap: () {
            // Navigate to DetailsScrn when a search result is tapped
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => DetailsScrn(postid: postId),
            ));
          },
          
        );
        
      },
      
    );
    
  },
)



    );
  }


  

List<InlineSpan> _getHighlightedSpans(String text, TextStyle highlightStyle) {
  List<InlineSpan> spans = [];
  String searchText = _searchController.text.toLowerCase();
  List<String> words = text.split(' ');
  for (String word in words) {
    if (word.toLowerCase().contains(searchText)) {
      spans.add(TextSpan(text: word + ' ', style: highlightStyle));
    } else {
      spans.add(TextSpan(text: word + ' ', style: TextStyle(color: Colors.black)));
    }
  }
  return spans;
}
}


