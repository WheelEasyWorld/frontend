import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';

import 'message.dart';
import 'new_message.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(""),
      backgroundColor: kPinkLightColor,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: const [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
