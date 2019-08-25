import 'package:flutter/material.dart';
class Map1 extends StatefulWidget {
  @override
  _Map1State createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello"), centerTitle: true, elevation: 4.0,),
      body: Center(child: Text("maps"),),

    );
  }
}
//called from products.dart inside pages