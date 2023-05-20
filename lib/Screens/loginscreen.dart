import 'package:chatx/CustomUI/buttoncard.dart';
import 'package:chatx/Screens/homeScreens.dart';
import 'package:flutter/material.dart';

import '../Model/chatmodel.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
        "Abdullah", "person.svg", false, "12:00", "Hi Abdullah", "", false, 1),
    ChatModel("Ali Khan", "person.svg", false, "5:00", "Hi Komal", "", false, 2),
    ChatModel(
        "Ali", "person.svg", false, "4:00", "Hi Ali How are u", "", false, 3),
    //ChatModel("Flutter Developer", "group.svg", true, "1:00",
    //  "Hi Flutter developers", "", false),
    ChatModel("Salman", "person.svg", false, "4:00", "Hi Salman", "", false, 4),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatModels.length,
          itemBuilder: (context, index) =>
              InkWell(
                  onTap: (){
                    sourceChat = chatModels.removeAt(index);
                    Navigator.push((context), MaterialPageRoute(builder: (builder)=>
                    HomeScreen(
                      chatModels: chatModels,
                      sourceChat: sourceChat,
                    )));
                  },
                  child: ButtonCard(name: chatModels[index].name, icon: Icons.person))),
    );
  }
}
