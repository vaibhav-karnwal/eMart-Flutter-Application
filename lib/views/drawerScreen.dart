import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerScreen extends StatefulWidget{
  @override
  _DrawerScreen createState() => _DrawerScreen();
}

class _DrawerScreen extends State<DrawerScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.white,size: 30,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding :EdgeInsets.all(20),
              color: Color(0xff6a89a5),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:28.0),
                      child: _backButton(),
                    ),
                    Container(
                      width: 200,
                      height: 110,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined,size: 40,),
                      ),
                    ),
                    Text(
                        "name",
                        style: TextStyle(
                            fontSize: 22,
                          color: Colors.white,
                        ),
                    ),
                    Text(
                      "email",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap:()async{
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}