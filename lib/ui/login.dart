import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _userController.clear();
      _passController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login", style: TextStyle(color: Colors.orange)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [
                0.1,
                0.3,
                0.7
              ],
              colors: [
                Colors.deepOrange[500],
                Colors.orange[400],
                Colors.yellow[100]
              ]),
        ),
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/watermark2.png',
              width: 120.0,
              height: 120.0,
              color: Colors.redAccent,
            ),
            new Container(
              alignment: Alignment.center,
              height: 180.0,
              width: 350.0,
//              color: Color(0xffa2dae8),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _passController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock_outline),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(15.1)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 35.5),
                          child: new RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.orange,
                            child: new Text(
                              "Login",
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 85.5),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.orange,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(10.1)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome, $_welcomeString",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
