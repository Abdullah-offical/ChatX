import 'package:chatx/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class LeandingScreen extends StatelessWidget {
  const LeandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("Welcome to chatX",style: TextStyle(
                fontSize: 29,color: Colors.teal,fontWeight: FontWeight.w600
              ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8,),
              Image.asset("assets/bg.png",color: Colors.greenAccent[700],
              height: 340,
              width: 340,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 9,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(
                  style: TextStyle(fontSize: 17,
                  color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Agree and Continue to accepts the"
                          ,style: TextStyle(color: Colors.grey[600])
                    ),
                    TextSpan(
                        text: " chatX Terms of Service and Privacy Policy",
                      style: TextStyle(color: Colors.cyan)
                    ),

                  ]
                )
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                      LogInPage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 110,
                  height: 50,
                  child: Card(
                    margin: EdgeInsets.all(0),
                      elevation: 6,
                      color: Colors.greenAccent[700],
                      child: Center(child: Text("AGREE AND CONTINUE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
