import 'package:chatx/Model/contrymodel.dart';
import 'package:chatx/NewScreens/conutrypage.dart';
import 'package:chatx/NewScreens/otpscreen.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  String countryName = "Pakistan";
  String countryCode = "+92";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Enter your Number",
          style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.w700, wordSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "chatX send sms to verify your number",
              style: TextStyle(fontSize: 13.5),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "what's my number?",
              style: TextStyle(fontSize: 12.8, color: Colors.cyan[800]),
            ),
            SizedBox(
              height: 15,
            ),
            countryCard(),
            SizedBox(height: 5,),
            number(),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: (){
                if(_controller.text.length < 10){
                  showMydilogue1();
                }else {
                  showMydilogue();
                }
              },
              child: Container(
                height: 40,
                width: 70,
                color: Colors.tealAccent[400],
                child: Center(
                  child: Text("NEXT" ,style: TextStyle(fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>
        CountryPage(setCountryData: setCountryData)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.8, color: Colors.teal))),
        child: Row(
          children: [
            Expanded(
                child: Container(
                    child: Center(
                        child: Text(
              countryName,
              style: TextStyle(fontSize: 17),
            )))),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  Widget number (){
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.8,
                  color: Colors.teal
                )
              )
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Text("+",style: TextStyle(fontSize: 17),),
                SizedBox(width: 15,),
                Text(countryCode.substring(1),style: TextStyle(fontSize: 15),),
              ],
            ),
          ),
          SizedBox(width: 30,),
          Container(
            width: MediaQuery.of(context).size.width /1.5-100,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.8,
                        color: Colors.teal
                    )
                )
            ),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Phone #"
              ),
            ),
          )
        ],
      ),
    );
  }
  void setCountryData(CountryModel countryModel){
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMydilogue (){
    return showDialog(context:context ,builder :(BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("We will be verify with your phone number",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              Text(countryCode+" "+_controller.text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
              SizedBox(height: 10,),
              Text("Is this Ok, or wpuld you like edit the number",style: TextStyle(fontSize: 13.5)),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Edit",style: TextStyle(color: Colors.teal),)),
          TextButton(onPressed: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> OTPScreen(
              countyCode: countryCode,
              number: _controller.text,
            )));
          }, child: Text("Ok",style: TextStyle(color: Colors.teal))),
        ],
      );
    }

    );
  }
  Future<void> showMydilogue1 (){
    return showDialog(context:context ,builder :(BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("there is no number entered",style: TextStyle(fontSize: 14),),
              ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok",style: TextStyle(color: Colors.teal),)),
        ],
      );
    }

    );
  }
}
