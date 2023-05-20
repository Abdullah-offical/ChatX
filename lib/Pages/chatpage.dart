import 'package:chatx/CustomUI/customcard.dart';
import 'package:chatx/Model/chatmodel.dart';
import 'package:chatx/Screens/selectcontect.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key,required this.chatModels,required this.sourceChat}) : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.chatModels.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.chatModels[index],
          sourceChat: widget.sourceChat,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (Builder) => SelectContext()));
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
