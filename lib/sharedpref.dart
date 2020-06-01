import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedPrefScreen();
  }
}

class _SharedPrefScreen extends State<SharedPrefScreen> {
  String _message = "No data received";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _message = (prefs.getString('message') ?? "No data received");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen with shared pref data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Data received"), Text(_message)],
        ),
      ),
    );
  }
}
