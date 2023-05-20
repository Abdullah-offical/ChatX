import 'package:camera/camera.dart';
import 'package:chatx/NewScreens/leandingscreen.dart';
import 'package:chatx/Screens/camerascreen.dart';
import 'package:chatx/Screens/homeScreens.dart';
import 'package:chatx/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        appBarTheme: AppBarTheme(
            color: Color(0xff128c7e),
        ),
        accentColor: Color(0xff075e54),
      ),
      home: LogInScreen(),
    );
  }
}
