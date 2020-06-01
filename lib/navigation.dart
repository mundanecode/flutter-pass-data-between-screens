import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  static const routeName = '/nav';
  @override
  Widget build(BuildContext context) {
    final String _message = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen with navigation data"),
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