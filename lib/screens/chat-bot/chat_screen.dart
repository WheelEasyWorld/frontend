import 'package:flutter/material.dart';
import 'package:frontend/screens/chat-bot/components/app_body.dart';
import 'package:frontend/screens/constants.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'components/message.dart';
import 'components/new_message.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
//import 'package:firebase_auth/firebase_auth.dart';

const json = <String, String>{
  "type": "service_account",
  "project_id": "wheeleasyworld-4336f",
  "private_key_id": "cf0b89cbf44737fa2903043e81d94dd787044517",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCauYP5odNIsYU3\nzv2/gI3De2P924dflpI7OAZevMjovNoEgf9hljnX0Of0gem10u8uXdbSmiQJbPql\nMXEhqfaxsadwjti8duJ48Mc5MFMyVEhbkurzgiyEQ1QEwbcAmgje8k8G9O9kbGsS\n1fJIvRUszwDVHUKWuJ8mPCwg5GZarbeyChS6XyXaYZP3QwzRNsXU42CpE8VSbBRy\nJQLIvgbtZyc/CCfjrc8mRfTSP8uUeOLp+tDrKo5fy0SzwOTJlSD+lp5OIOJVjkRJ\njIbrUOToKgr66t9U3Yynkx3x5jjvFlzaLHryLnqXIN/HGz8A8tn34jhsNVf94fsZ\n7kR1jx6TAgMBAAECggEASG3luPsnJBVt7mUoZfgw5LyjX1ff9EBRLgWY/cpUJpcZ\nXBjayvz/EOdLXitek24t5z+oa6gajIsGfkQ52G9u+1nVrxw/m2HvvHvCVyQnHh1U\nTgHlmJ5sZnH6J8vi9hYlZvB5TCFm21ThfszGgYR6ICK7Ggh7foDoh4aNhcxFmdaU\nHI9vQi25VTg+M4iJ62V2jhHrS9e7Vke6Bnjy2x/ryAg1uS4HTMUqBovnw1hz7og4\nedW2cGLy10hu1zAbpLNr05sdljQEvp00kHj9g6MV6y0iTV7p56/Mpa/qj+d6GyGF\nmWYZHqtH3Glheqy7Vgr9lHx7ejl/kF6w6oa4M3TYgQKBgQDH8fWIjfqKJ2cm3mdg\nuOFZWdtPrLGIBLvO1A8JvZV4mTH3kDVSa7TVsFNKL43pG4aVTh66BdZmD8j/BPF5\nSO6/NKuSiaOd6cPYVNspn4H9tUgA6gRWWfdmsDn3CCxieXOPVLh+SmuU6CJmcrdy\nyomRjDG2mbAX5TdBqiEGi++rUwKBgQDGGhZmyx0CJQizNY6QyL2uEnAebCY7nidc\nlpN2ayv4Op+p6vS1WjqfQmm9UzZEcetPeBxF10pEcrpZpV+BW7mg1t6HFFdCNnyV\nPziUDj79YE0tpqYJ0nBr9sJqWJ2CF4NwLkOkoaZazP+tLGJ6rBlUTrvQbgDTTWB0\nyPLgr8uXwQKBgQCot2YtnUiNLWSgaskm17roD6e82odPtFbZ1xz9ZilrgzGjqd8k\ntlf4fPo7PldsHVr6P9oztFtO8gD0GDK+2ikD1Sj11QjoZmpo8Gmi/MLO2BpzEwUn\n7HCUCR5QcmgpjDxT9PRdNOUE2MC2XBSqW3esBnWolJUABN4Unb+Sa6CImwKBgCs5\nrgGn+CBrrEZOPVliM+EzrLs2pfEERVpykKKaJ/H1+Li+x756fagaebAR5BlzMgEZ\nGDI1E8NztS2yY/B57zslJ1EaIyATe4OlU9cadKwcwzpezoP+IwGryigiRdwI/WkQ\n7zmQ/Bd7+53xvVs/ChfXRivolM2GaLGS10wnj6kBAoGBAKJJxZBkqriZavMM+WW5\n6e3aaNn07qTQfxYHH4drYQKG5vQ0GwEGPXk43T5wcRodJ0eNgdKx3G0Rj12y+7tY\nGXINtOvnQDlllrUacE0O8Zcsc3bDyK/Q3HT9eXwE9unOxVp9M8JJoubT9uo9ZBIN\njpwxI5okQPWCSGpKSguKTOHB\n-----END PRIVATE KEY-----\n",
  "client_email": "wheeleasyworld-4336f@appspot.gserviceaccount.com",
  "client_id": "112900952518489572833",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/wheeleasyworld-4336f%40appspot.gserviceaccount.com"
};

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  User? user;
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void loadDialogFlowInstance() async {
    dialogFlowtter = DialogFlowtter.fromJson(json);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUser();
      print(user?.id);
    });
    loadDialogFlowInstance();
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
      // body: Container(
      //   alignment: Alignment.topLeft,
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: Messages(user!.id),
      //       ),
      //       NewMessage(),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(child: AppBody(messages: messages)),
          Container(
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
                      // onChanged: (value) {
                      //   setState(() {
                      //     _userEnterMessage = value;
                      //   });
                      // },
                    ),
                  ),
                  IconButton(
                    color: kCoralColor,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    // dialogFlowtter.projectId = "deimos-apps-0905";

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}
