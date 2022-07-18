import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Logout'),
                  ],
                ),
              ),
              // DropdownMenuItem(
              //   value: 'location',
              //   child: Row(
              //     children: const [
              //       Icon(Icons.map),
              //       SizedBox(width: 8),
              //       Text('Location')
              //     ],
              //   ),
              // ),
            ],
            onChanged: (value) {
              if (value == 'logout') {
                FirebaseAuth.instance.signOut();
                //log out app
              }
            },
          )
        ],
      ),
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
                  padding: const EdgeInsets.all(8),
                  child: Text(documents[index]["text"]),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection("chats/jo6fgCwQ2VbQcYGN9UIl/messages")
              .add({'text': "This was added by clicking the button!"});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
