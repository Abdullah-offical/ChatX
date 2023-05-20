import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key,required this.messsage,required this.time}) : super(key: key);
  final String messsage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 10, bottom: 20),
                child: Text(
                  messsage,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Text(
                  time,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
