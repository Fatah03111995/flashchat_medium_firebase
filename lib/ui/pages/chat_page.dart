// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat_medium/core/constants/constant.dart';
import 'package:flashchat_medium/core/message_db.dart';
import 'package:flashchat_medium/core/user_connection.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static String id = 'chatpage/';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User? loggedinUser;
  String messageText = '';

  void getCurrentUser() {
    try {
      final User? user = UserConnection().getCurrentUser();
      if (user != null) {
        loggedinUser = user;
      }
      Navigator.pop(context);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      print(e);
    }
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void getMessagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getMessagesStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Text(
          '⚡️Chat',
          style: TextStyles.mlBold,
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
              onPressed: () {
                UserConnection().logOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                messageText = value;
              },
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          TextButton(
            onPressed: () {
              MessageDb()
                  .sendMessage(text: messageText, sender: loggedinUser?.email);
            },
            child: const Text(
              'Send',
              style: kSendButtonTextStyle,
            ),
          )
        ],
      )),
    );
  }
}
