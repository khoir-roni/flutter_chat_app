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
