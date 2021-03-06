

import 'package:flutter/material.dart';
import 'package:helloworld/use_email/signIn.dart';
import 'package:helloworld/use_email/signUp.dart';
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my firebase app"),

      ),
      body: Stack(
        children: <Widget>[
          Image.network("https://media1.giphy.com/media/eJRuUt3VzkWKqzlyA0/200w.webp?cid=790b7611566702feb29576d1173f3f1f04db18016dd7cc82&rid=200w.webp", fit: BoxFit.cover, height: double.infinity, width: double.infinity,),
Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('sign in'),
          ),
          RaisedButton(
            onPressed: navigateToSignUp,
            child: Text('sign up'),
          )
        ],
      ),


        ],
      )
      
      
    );
  }
  void navigateToSignIn(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInPage(), fullscreenDialog: true));
  }
   void navigateToSignUp(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(), fullscreenDialog: true));
  }
}