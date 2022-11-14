import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble(this.message, this.userId, {super.key});

  final String message;
  final num userId;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUser();
      print('실행이 되고 있는걸까요');
      print(user?.id);
      print(widget.userId);
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
    return Column(
      children: [
        user?.id == widget.userId
            ? BubbleSpecialThree(
                text: widget.message,
                color: kYellowColor,
                tail: false,
                isSender: true,
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
              )
            : BubbleSpecialThree(
                text: widget.message,
                color: Colors.white,
                tail: true,
                isSender: false,
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
              )
      ],
    );
  }
}
