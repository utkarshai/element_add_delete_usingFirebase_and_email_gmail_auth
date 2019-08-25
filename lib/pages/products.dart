import 'package:flutter/material.dart';
import 'package:helloworld/maps/map1.dart';

import '../widgets/products/products.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _page = 0;
  String str = "page: ";
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              //Image.network("https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",height: 150.0, width: 150.0,),

              ListTile(
                title: Image.network(
                  "https://media2.giphy.com/media/eYXDv676WFGkE/giphy.webp?cid=790b7611182b53549e53d32da2304e717c0e4690a15e995b&rid=giphy.webp",
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Manage Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('EasyList'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text("visit page 0 to see your products, page 3 to see the location, page 4 for feedback"),
                      if (_page == 1)
                        Image.network(
                          "https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                          height: 150.0,
                          width: 150.0,
                        ),
                      if (_page == 2)
                        Image.network(
                          "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          height: 150.0,
                          width: 150.0,
                        ),
                      if (_page == 3)
                        Image.network(
                          "https://images.unsplash.com/photo-1453831362806-3d5577f014a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          height: 150.0,
                          width: 150.0,
                        ),
                        if(_page==3)
                        RaisedButton(
                          color: Colors.yellowAccent,
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Map1(),
                          )),
                          child: Text("check location", style: TextStyle(color: Colors.green ),),
                        ),
                      if (_page != 4)
                        Text(str + (_page).toString(), textScaleFactor: 7.0),
                      if (_page != 4)
                        RaisedButton(
                          child: Text('Go To Page of index 1'),
                          onPressed: () {
                            final CurvedNavigationBarState navBarState =
                                _bottomNavigationKey.currentState;
                            navBarState.setPage(1);
                          },
                        ),
                      if (_page == 4) Feedback(),
                    ],
                  ),
                ),
              ),
            ),
            if (_page == 0) Products(),
          ],
        ));
  }
}

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Column(
        children: <Widget>[
          Text(
            "Feedback",
            textScaleFactor: 3.5,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Container(
            height: 150.0,
            color: Colors.white,
            child: TextField(
              maxLines: 10,
              style: TextStyle(
                backgroundColor: Colors.yellowAccent,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
              ),
            ),
          ),
          RaisedButton(
              onPressed: () {},
              color: Colors.yellow,
              child: Container(
                width: 90.0,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.save_alt),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text("Submit"),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
