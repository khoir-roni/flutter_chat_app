import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chats/jo6fgCwQ2VbQcYGN9UIl/messages")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if (!snapshot.hasData) return const SizedBox.shrink();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = snapshot.data.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  child: Text(documents[index]["text"]),
                );
                // final docData = snapshot.data.docs[index].data();
                // final dateTime = (docData['timestamp'] as Timestamp).toDate();
                // return ListTile(
                //   title: Text(dateTime.toString()),
                // );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
