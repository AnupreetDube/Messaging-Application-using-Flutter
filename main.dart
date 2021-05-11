import 'package:FlutterMessenger/chat.dart';
import 'package:FlutterMessenger/inbox.dart';
import 'package:FlutterMessenger/login.dart';
import 'package:FlutterMessenger/register.dart';
import 'package:FlutterMessenger/search.dart';
import 'package:FlutterMessenger/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen',
      routes: {
        'login': (context) => Login(),
        'registration': (context) => Registration(),
        'splashscreen': (context) => SplashScreen(),
        'chat': (context) => Chat(),
        'inbox': (context) => Inbox(),
        'search': (context) => Search(),},);}}
