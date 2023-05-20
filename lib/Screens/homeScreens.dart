import 'package:chatx/Pages/camerapage.dart';
import 'package:chatx/Pages/chatpage.dart';
import 'package:flutter/material.dart';

import '../Model/chatmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.chatModels,required this.sourceChat}) : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatX"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(
                child: Text("New Group"),
              value: "New Group",),
              PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New Broadcast",),
              PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: "WhatsApp Web",),
              PopupMenuItem(
                child: Text("Starred Message"),
                value: "Starred Message",),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHAT",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(
            chatModels: widget.chatModels,
            sourceChat: widget.sourceChat,
          ),
          Center(child: Text("Calls" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue),))
        ],
      ),
    );
  }
}
