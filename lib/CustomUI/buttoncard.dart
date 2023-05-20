import 'package:chatx/Model/chatmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatx/Screens/selectcontect.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key,required this.name,required this.icon}) : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xff128c7e),
            radius: 23,
            child: Icon(icon,color: Colors.white,size: 30,),
          ),
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
