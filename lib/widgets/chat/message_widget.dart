import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future<User>.value(FirebaseAuth.instance.currentUser),
      builder: (BuildContext context, AsyncSnapshot futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final chatDocs = chatSnapshot.data.docs;

            return ListView.builder(
              reverse: true,
              itemCount: chatDocs.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageBubble(
                  chatDocs[index]['text'],
                  chatDocs[index]['username'],
                  chatDocs[index]['userImage'],
                  chatDocs[index]['userId'] == futureSnapshot.data.uid,
                  // key: ValueKey(chatDocs[index].id),
                );
              },
            );
          },
        );
      },
    );
  }
}
