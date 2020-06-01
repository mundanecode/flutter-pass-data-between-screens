import 'package:flutter/material.dart';
import 'package:flutterscreendatapassing/constructor.dart';
import 'package:flutterscreendatapassing/sharedpref.dart';
import 'navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Data Sharing Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/nav': (BuildContext context) => NavigationScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _gotoSharedPref() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("message", "Hello from main to Shared Pref screen");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SharedPrefScreen()),
    );
  }
  _gotoConstructor() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConstructorScreen("Hello from main to constructor screen")),
    );
  }
  _gotoNavigator() {
    Navigator.pushNamed(
      context,
      '/nav',
      arguments: "Hello from main to Navigation screen",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: _gotoSharedPref,
                child: Text("Pass data with Shared Pref")),
            RaisedButton(
                onPressed: _gotoConstructor,
                child: Text("Pass data with constructor")),
            RaisedButton(
                onPressed: _gotoNavigator,
                child: Text("Pass data with Navigator")),
          ],
        ),
      ),
    );
  }
}
