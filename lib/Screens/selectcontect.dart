import 'package:chatx/CustomUI/buttoncard.dart';
import 'package:chatx/CustomUI/contectcard.dart';
import 'package:chatx/Model/chatmodel.dart';
import 'package:chatx/Screens/creategroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectContext extends StatefulWidget {
  const SelectContext({Key? key}) : super(key: key);

  @override
  State<SelectContext> createState() => _SelectContextState();
}

class _SelectContextState extends State<SelectContext> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contect = [
      ChatModel("Abdullah", "", true, "", "", "A Flutter Developer",false,0),
      ChatModel("Murtaza Ali", "", true, "", "", "A Full stock developer",false,0),
      ChatModel("Imran", "", true, "", "", "Botany student",false,0),
      ChatModel("Abdullah", "", true, "", "", "A Flutter Developer",false,0),
      ChatModel("Komal", "", true, "", "", "Good Bye",false,0),
      ChatModel("Abdullah", "", true, "", "", "A Flutter Developer",false,0),
      ChatModel("Murtaza Ali", "", true, "", "", "A Full stock developer",false,0),
      ChatModel("Imran", "", true, "", "", "Botany student",false,0),
      ChatModel("Abdullah", "", true, "", "", "A Flutter Developer",false,0),
      ChatModel("Komal", "", true, "", "", "Good Bye",false,0),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Context",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "256 contects",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a Friend"),
                  value: "Invite a Friend",
                ),
                PopupMenuItem(
                  child: Text("Contects"),
                  value: "Contects",
                ),
                PopupMenuItem(
                  child: Text("Referesh"),
                  value: "Referesh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contect.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) =>
                                  CreateGroup()));
                    },
                    child: ButtonCard(name: "New Group", icon: Icons.groups));
              } else if (index == 1) {
                return ButtonCard(name: "New Contect", icon: Icons.person_add);
              } else {
                return ContectCard(
                  contect: contect[index - 2],
                );
              }
            }));
  }
}
