import 'package:chatx/Model/chatmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatorCard extends StatelessWidget {
  const AvatorCard({Key? key,required this.contect}) : super(key: key);
  final ChatModel contect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.clear,
                      size: 13,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          SizedBox(height: 2,),
          Text(contect.name,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
