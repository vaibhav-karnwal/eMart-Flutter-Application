import 'package:emart/views/homepage.dart';
import 'dart:async';
import 'package:emart/Authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
  var _visible = true;
  SharedPreferences logInData;
  bool isLoggedIn;
  var subscription;

  @override
  void initState() {
    super.initState();
    displaySplash();
  }


  displaySplash() async{
    Timer(Duration(seconds: 4), () async{
 //   if(await Login().auth.currentUser() != null){
   //   Route route = MaterialPageRoute(builder: (_) =>HomePage());
 //     Navigator.pushReplacement(context, route);
   // }
 //    else{
      logInData = await SharedPreferences.getInstance();
      var isLoggedIn = (logInData.getBool('login') ?? false);
      bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        Route route = MaterialPageRoute(builder: (_) =>HomePage());
        Navigator.pushReplacement(context, route);
      }
      else if(isLoggedIn == true){
        Route route = MaterialPageRoute(builder: (_) =>HomePage());
        Navigator.pushReplacement(context, route);
      }
      else {
        Route route = MaterialPageRoute(builder: (_) =>LoginPage());
        Navigator.pushReplacement(context, route);
      }
   });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          Container(
        //    margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFBAA48), Color(0xff2b98f7)]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Positioned(

            child: Center(
              child: Container(
                child: Image.asset(
                    "assets/images/unnamed.png",
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width/2,
                  ),
              ),
            ),
            ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: Center(
                      child:Image(
                        image: AssetImage('assets/logo/emart_white.png'),
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
    );
  }
}