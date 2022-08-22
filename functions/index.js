const functions = require("firebase-functions");


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const admin = require("firebase-admin");

admin.initializeApp();

exports.myFunction = functions.firestore
    .document("chat/{message}")
    .onCreate((snap, _context) => {
      return admin.messaging().sendToTopic("chat", {
        notification: {
          title: snap.data().username,
          body: snap.data().text,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      });
    });

// "start": "npm run shell",
