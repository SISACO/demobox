import 'package:Donobox/screens/details/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  final SearchData;
  const SearchResultsScreen({super.key, required this.SearchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("test"),
    );
  }
}
// StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('PostData')
//           .where(SearchData)
//           .snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         // If there are no search results
//         if (snapshot.data!.docs.isEmpty) {
//           return Text('No search results found');
//         }

//         // Display the search results in a ListView
//         return ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot document = snapshot.data!.docs[index];
//             String postId = document.id;

//             // Display the search result item
//             return ListTile(
//               title: Text(document['title']),
//               onTap: () {
//                 // Navigate to DetailsScrn when a search result is tapped
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (ctx) => DetailsScrn(postid: postId),
//                 ));
//               },
//             );
//           },
//         );
//       },
//     );