import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/constants.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() async {
    print("send message");
    FocusScope.of(context).unfocus();
    User? _user = await UserApi.instance.me();
    print(_user);
// 출력된 정보
/*
 {id: 2521100750, 
 properties: 
            {nickname: 민지, 
            profile_image: https://k.kakaocdn.net/dn/BPC0J/btrQDcwPw9J/XSKiBhUd7iFkxfOZ6IwnI1/img_640x640.jpg, 
            thumbnail_image: https://k.kakaocdn.net/dn/BPC0J/btrQDcwPw9J/XSKiBhUd7iFkxfOZ6IwnI1/img_110x110.jpg}, 
            kakao_account: {profile_nickname_needs_agreement: false, profile_image_needs_agreement: false, profile: {nickname: 민지, thumbnail_image_url: https://k.kakaocdn.net/dn/BPC0J/btrQDcwPw9J/XSKiBhUd7iFkxfOZ6IwnI1/img_110x110.jpg, profile_image_url: https://k.kakaocdn.net/dn/BPC0J/btrQDcwPw9J/XSKiBhUd7iFkxfOZ6IwnI1/img_640x640.jpg, is_default_image: false}}, 
            connected_at: 2022-11-11T08:36:02.000Z}
 */
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userID': _user.id,
      'userName': _user.properties?.values.first, // 사용자의 nickname
    });
    print('done');
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                        )),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    labelText: 'Type here...',
                    hintStyle: const TextStyle(color: kCoralColor),
                    suffixIcon: const Icon(Icons.add_a_photo_outlined)),
                onChanged: (value) {
                  setState(() {
                    _userEnterMessage = value;
                  });
                },
              ),
            ),
            IconButton(
                onPressed:
                    _userEnterMessage.trim().isEmpty ? null : _sendMessage,
                icon: const Icon(Icons.send),
                color: kCoralColor),
          ],
        ),
      ),
    );
  }
}
