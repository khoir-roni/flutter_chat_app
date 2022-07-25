import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data.docs;
        return ListView.builder(
          reverse : true,
          itemCount: chatDocs.length,
          itemBuilder: (BuildContext context, int index) {
            return MessageBubble(chatDocs[index]['text']);
          },
        );
      },
    );
  }
}
