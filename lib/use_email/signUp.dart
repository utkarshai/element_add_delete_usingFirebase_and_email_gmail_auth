import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:helloworld/use_email/signIn.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
TextFormField(
  validator: (input) {
    if(input.isEmpty){
      return 'please type an email';
    }
  } ,
  onSaved: (input)=> _email=input,
  decoration: InputDecoration(
    labelText: "email",
  ),
),
TextFormField(
  validator: (input) {
    if(input.length<6){
      return 'your password shoould be of 6 characters';
    }
  } ,
  onSaved: (input)=> _password=input,
  decoration: InputDecoration(
    labelText: "password",
  ),
  obscureText: true,
),
RaisedButton(
  onPressed: signUp,
  child: Text("Sign Up"),
),
          ],
        ),
        ),
    );
  }
  Future<void> signUp() async {
    final formState = _formkey.currentState;

    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.user.sendEmailVerification();
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user: user.user)));
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInPage()));
      }catch(e){
        print(e.message);
        print("e rror!!!!!!!");
      }
      
    }
  }
}