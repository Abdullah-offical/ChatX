import 'package:chatx/Model/chatmodel.dart';
import 'package:chatx/Screens/individualpages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatx/Screens/selectcontect.dart';

class ContectCard extends StatelessWidget {
  const ContectCard({Key? key,required this.contect}) : super(key: key);
  final ChatModel contect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 53,
            width: 50,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[200],
                  radius: 23,
                  child: SvgPicture.asset(
                    "assets/person.svg",
                    color: Colors.white,
                    width: 30,
                    height: 30,
                  ),
                ),
                contect.select ? Positioned(
                  bottom: 4,
                  right: 5,
                  child: CircleAvatar(
                    radius: 11,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.check,size: 18,color: Colors.white,)),
                ) :Container(),
              ],
            ),
          ),
          title: Text(
            contect.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            contect.status,
            style: TextStyle(fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 80),
          child: Divider(
            thickness: 2,
          ),
        )
      ],
    );
  }
}
