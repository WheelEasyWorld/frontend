//채팅 앱의 메세지를 보여주는 페이지입니다.
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/screens/chat-bot/components/chat_bubble.dart';
import 'package:get/get.dart';

class Messages extends StatelessWidget {
  const Messages(this.userId, {super.key});
  final num userId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat-$userId')
          .orderBy('time', descending: true)
          .snapshots(),
      //최신의 snapshot을 가져오기 위한 절차
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;
        print(chatDocs);

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 1, horizontal: Get.width * 0.015),
              child: ChatBubble(
                chatDocs[index]['text'],
                chatDocs[index]['userID'],
                userId,
              ),
            );
          },
        );
      },
    );
  }
}
