import 'package:FlutterMessenger/inbox.dart';
import 'package:FlutterMessenger/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}
class _ChatState extends State<Chat> {
  String userName;
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Messenger',
          style: TextStyle(color: Color(0xff37ebea)),
        ),
        leading: Image.asset(
          'assets/images/LOGO.png',
          scale: 10,
        ),
        backgroundColor: Color(0xff013a4a),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                await auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
      backgroundColor: Color(0xff013a4a),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.blue,
        onPressed: () => Navigator.pushNamed(context, 'Search Route'),
        child: Icon(Icons.search),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey there! ',
                    style: TextStyle(color: Colors.white, fontSize: 34),
                  ),
                  Text(
                    auth.currentUser.email ?? 'Username',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ],
              ),
            ),
            Text(
              'New Messages',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('g'),
              ),
              title: Text(
                'User-1',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Inbox(userName: 'User-2'),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('U1'),
              ),
              title: Text(
                'User-2',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('U2'),
              ),
              title: Text(
                'User-3',
                style: TextStyle(color: Colors.white),),),],),
      ),
    );
  }
}
