import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TimeStampScreen extends StatelessWidget {
  const TimeStampScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: StreamBuilder(
          stream: firestore.collection('testing').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final docData = snapshot.data.docs[index].data();
                final dateTime = (docData['timestamp'] as Timestamp).toDate();
                return ListTile(
                  title: Text(dateTime.toString()),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firestore
              .collection('testing')
              .add({'timestamp': Timestamp.fromDate(DateTime.now())});

        
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

  //      FirebaseFirestore.instance
          //     .collection("chats/jo6fgCwQ2VbQcYGN9UIl/messages")
          //     .snapshots()
          //     .listen((data) {
          //   data.docs.forEach((element) {
          //     print(element["text"]);
          //   });
          // });
// print(data.docs[0]["text"]);
            // final textData = [];
            // for (var doc in event.docs) {
            //   textData.add(doc.data()["text"]);
            // }
            // print("cities in CA: ${textData.join(", \n")}");
      
          // firestore
          //     .collection("testing")
          //     // .where("state", isEqualTo: "CA")
          //     .snapshots()
          //     .listen((event) {
          //   final docData = [];
          //   for (var doc in event.docs) {
          //     final data = (doc.data()["timestamp"] as Timestamp).toDate();
          //     docData.add(data.toString());
          //   }
          //   print("timestamp1: ${docData.join(", \n")}");
          // });