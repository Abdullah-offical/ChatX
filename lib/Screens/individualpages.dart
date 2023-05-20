import 'package:chatx/CustomUI/onmsgcard.dart';
import 'package:chatx/CustomUI/replycard.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../Model/chatmodel.dart';
import '../Model/messageModel.dart';
import '../Pages/camerapage.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {Key? key, required this.chatModel, required this.sourceChat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  TextEditingController _controller = TextEditingController();
  bool sendButton = false;
  ScrollController _scrollController = ScrollController();
  List<MessageModel> messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coneect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void coneect() {
    socket = IO.io("http://192.168.1.115:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.emit("signin", widget.sourceChat.id);
    socket.connect();
    socket.onConnect((data) {
      print("connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(
            _scrollController
                .position.maxScrollExtent,
            duration:
            Duration(milliseconds: 300),
            curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(message, type,DateTime.now().toString().substring(10,16));
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whatsap.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70.0,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup
                          ? "assets/group.svg"
                          : "assets/person.svg",
                      color: Colors.white,
                      height: 37,
                      width: 37,
                    ),
                    backgroundColor: Colors.blueGrey,
                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: TextStyle(
                          fontSize: 18.5, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "last seen today at 12:05",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View Contect"),
                    value: "View Contect",
                  ),
                  PopupMenuItem(
                    child: Text("Media links, and docs"),
                    value: "Media links, and docs",
                  ),
                  PopupMenuItem(
                    child: Text("WhatsApp Web"),
                    value: "WhatsApp Web",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute Notification"),
                    value: "Mute Notification",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                ];
              })
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  //height: MediaQuery.of(context).size.height - 140,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == messages.length){
                        return Container(
                          height: 70,
                        );
                      }
                      if (messages[index].type == "source") {
                        return OnMsgCard(
                          messsage: messages[index].message,
                          time: messages[index].time,
                        );
                      } else {
                        return ReplyCard(
                          messsage: messages[index].message,
                            time: messages[index].time
                        );
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                    margin: EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    child: TextFormField(
                                      controller: _controller,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendButton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type a message",
                                          prefixIcon: IconButton(
                                            icon: Icon(Icons.emoji_emotions,
                                                color: Color(0xff075e54)),
                                            onPressed: () {
                                              setState(() {
                                                show = !show;
                                              });
                                            },
                                          ),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (builder) =>
                                                            buttomsheet());
                                                  },
                                                  icon: Icon(Icons.attach_file,
                                                      color: Color(0xff075e54))),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CameraPage()));
                                                  },
                                                  icon: Icon(
                                                    Icons.camera_alt,
                                                    color: Color(0xff075e54),
                                                  ))
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.all(5)),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, left: 2, right: 5),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff075e54),
                                radius: 25,
                                child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          if (sendButton) {
                                            _scrollController.animateTo(
                                                _scrollController
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.easeOut);
                                            sendMessage(
                                                _controller.text,
                                                widget.sourceChat.id,
                                                widget.chatModel.id);
                                            _controller.clear();
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          sendButton ? Icons.send : Icons.mic,
                                        ))),
                              ),
                            )
                          ],
                        ),
                        show ? emojiSelect() : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buttomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Documents"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.person, Colors.blue, "Context"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: Config(
        columns: 7,
      ),
      onEmojiSelected: (emoji, category) {
        print(emoji);
        setState(() {
          _controller.text = _controller.text + emoji.toString();
        });
      },
    );
  }
}
