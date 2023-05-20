import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key,required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.crop_rotate,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.title,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 27,)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                child: TextFormField(
                  style: TextStyle(fontSize: 15,
                      color: Colors.white),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    icon: Icon(Icons.add_photo_alternate,color: Colors.white,size: 27,),
                    border: InputBorder.none,
                    hintText: "Add Captions....",
                    hintStyle: TextStyle(fontSize: 15,
                    color: Colors.white),
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 27,
                      child: Icon(Icons.check,color: Colors.white,size: 27,),
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
