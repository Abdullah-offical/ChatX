import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key,required this.countyCode,required this.number}) : super(key: key);
  final String countyCode;
  final String number;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("verify ${widget.countyCode} ${widget.number}"
        ,style: TextStyle(
            color: Colors.teal,
            fontSize: 16.5,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.black,))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(height: 10,),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "We have sent an SMS with a code to ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.5,
                      ),
                    ),
                    TextSpan(
                      text: " " + widget.countyCode + " " + widget.number,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(
                      text: " Wrong number?",style: TextStyle(
                      color: Colors.cyan[800],fontSize: 14.5
                    )
                    )
                  ]
                ),
            ),
            SizedBox(height: 5,),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 30,
              style: TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            SizedBox(height: 30,),
            Text("Enter 6.Digits code",style:
              TextStyle(
                color: Colors.grey[600],fontSize: 14
              ),),
            SizedBox(height: 30,),
            buttonButton("Resend SMS",Icons.message),
            SizedBox(height: 12,),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(height: 12,),
            buttonButton("Call Me",Icons.call),

          ],
        ),
      ),
    );
  }
  Widget buttonButton (String text, IconData icon) {
    return Row(
      children: [
        Icon(icon,color: Colors.teal,size: 24,),
        SizedBox(width: 25,),
        Text(text,style: TextStyle(
            color: Colors.teal,fontSize: 14.5
        )
        )
      ],
    );
  }
}
