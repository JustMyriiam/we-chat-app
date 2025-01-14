import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_chat_app/models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> sendMessage(String receiverID, message) async {
    final currentUserID = _auth.currentUser!.uid;
    final currentUserEmail = _auth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatID = ids.join('_');

    await _firestore
        .collection("Chats")
        .doc(chatID)
        .collection("Messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessagesStream(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatID = ids.join('_');

    return _firestore
        .collection("Chats")
        .doc(chatID)
        .collection("Messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
