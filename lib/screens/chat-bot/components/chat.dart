import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'message.dart';
import 'new_message.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUser();
      print(user?.id);
    });
  }

  void _getUser() async {
    User? _user = await UserApi.instance.me();
    setState(() {
      this.user = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(""),
      backgroundColor: kPinkLightColor,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Expanded(
              child: Messages(user!.id),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
