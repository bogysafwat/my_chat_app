import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/services/auth/auth_service.dart';
import 'package:my_chat_app/widgets/my_message.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void logout() {
    final authService = AuthService();
    authService.logout();
  }

  User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
  }

  void addMessage() {
    print('called');
    if (_controller.text.isEmpty) return;
    _db.collection('chats').add({
      'userId': user?.uid,
      'message': _controller.text,
      'timestamp': FieldValue.serverTimestamp()
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Chat App'),
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () => logout(), icon: Icon(Icons.logout))
        ],
      ),
      body: Column(children: [
        Expanded(
            child: StreamBuilder(
                stream:
                    _db.collection('chats').orderBy('timestamp').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.teal,
                    ));
                  final messages = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: messages.length,
                      itemBuilder: (ctx, index) {
                    var message = messages[index];
                    bool isMe = message['userId'] == user?.uid;
                    return MyMessage(message: message['message'], isMe: isMe);
                  });
                })),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              IconButton(onPressed: addMessage, icon: Icon(Icons.send))
            ],
          ),
        )
      ]),
    );
  }
}
