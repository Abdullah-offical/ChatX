import 'package:chatx/CustomUI/avitacard.dart';
import 'package:chatx/CustomUI/buttoncard.dart';
import 'package:chatx/CustomUI/contectcard.dart';
import 'package:chatx/Model/chatmodel.dart';
import 'package:chatx/Screens/creategroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contect = [
    ChatModel("Abdullah", "", true, "", "", "A Flutter Developer", false,0),
    ChatModel("Murtaza Ali", "", true, "", "", "A Full stock developer", false,0),
    ChatModel("Imran", "", true, "", "", "Botany student", false,0),
    ChatModel("Abdullah", "", true, "", "", "A Flutter Developer", false,0),
    ChatModel("Salman", "", true, "", "", "Good Bye", false,0),
    ChatModel("Abdullah", "", true, "", "", "A Flutter Developer", false,0),
    ChatModel("Murtaza Ali", "", true, "", "", "A Full stock developer", false,0),
    ChatModel("Imran", "", true, "", "", "Botany student", false,0),
    ChatModel("Abdullah", "", true, "", "", "A Flutter Developer", false,0),
    ChatModel("Ali", "", true, "", "", "Good Bye", false,0),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add Perticepnts",
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
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contect.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  {
                    return InkWell(
                      onTap: () {
                        if (contect[index - 1].select == false) {
                          setState(() {
                            contect[index - 1].select = true;
                            groups.add(contect[index - 1]);
                          });
                        } else {
                          setState(() {
                            contect[index - 1].select = false;
                            groups.remove(contect[index - 1]);
                          });
                        }
                      },
                      child: ContectCard(
                        contect: contect[index - 1],
                      ),
                    );
                  }
                }),
            groups.length > 0 ?Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contect.length,
                      itemBuilder: (context, index){
                        if (contect[index].select == true){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                contect[index].select = false;
                                groups.remove(contect[index]);
                              });
                            },
                            child: AvatorCard(
                              contect: contect[index],
                            ),
                          );
                        }
                        else {
                          return Container();
                        }
                      }
                  ),
                ),
                Divider(
                  thickness: 2,
                )
              ],
            ):Container(),
          ],
        ));
  }
}
