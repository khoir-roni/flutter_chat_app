import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';
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
Future<void> _setupPermission () async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');
}

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        
       
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      
    //    FirebaseMessaging.instance
    //       .getInitialMessage()
    //       .then((RemoteMessage message) {
    //     if (message != null) {
    //       print(message);
    //     }

    //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //       print('Got a message whilst in the foreground!');
    //       print('Message data: ${message.data}');

    //       if (message.notification != null) {
    //         print(
    //             'Message also contained a notification: ${message.notification}');
    //       }
    //     });
    //   });
    });
  }

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




