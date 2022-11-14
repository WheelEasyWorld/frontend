import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble(this.message, this.userId, this.myId, {super.key});

  final String message;
  final num userId;
  final num myId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myId == userId
            ? BubbleSpecialThree(
                text: message,
                color: kYellowColor,
                tail: false,
                isSender: true,
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
              )
            : BubbleSpecialThree(
                text: message,
                color: Colors.white,
                tail: true,
                isSender: false,
                textStyle: TextStyle(color: Colors.black, fontSize: 16),
              )
      ],
    );
  }
}
