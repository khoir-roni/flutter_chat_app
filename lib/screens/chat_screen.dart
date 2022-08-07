import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/chat/message_widget.dart';
import '../widgets/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
// String _token;

//   Future<void> setupToken() async {
//     // Get the token each time the application loads
//     String token = await FirebaseMessaging.instance.getToken();

//     // Save the initial token to the database
//     await saveTokenToDatabase(token);

//     // Any time the token refreshes, store this in the database too.
//     FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
//   }

//   @override
//   void initState() {
//     super.initState();
    
//     setupToken();
//   }
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
      body: Container(
        child: Column(children: [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ]),
      ),
    );
  }
}

// Future<void> saveTokenToDatabase(String token) async {
//   // Assume user is logged in for this example
//   String userId = FirebaseAuth.instance.currentUser.uid;

//   await FirebaseFirestore.instance
//     .collection('users')
//     .doc(userId)
//     .update({
//       'tokens': FieldValue.arrayUnion([token]),
//     });
// }




