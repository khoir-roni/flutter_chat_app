import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/chat/message_widget.dart';
import '../widgets/chat/new_message.dart';

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
