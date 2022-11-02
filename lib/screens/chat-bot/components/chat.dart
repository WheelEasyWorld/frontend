import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message.dart';
import 'new_message.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  // final _authentication = FirebaseAuth.instance;
  // User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCurrentUser();
  }

  // void getCurrentUser() {
  //   try {
  //     final user = _authentication.currentUser;
  //     if (user != null) {
  //       loggedUser = user;
  //       print(loggedUser!.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('COMMENTS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
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
