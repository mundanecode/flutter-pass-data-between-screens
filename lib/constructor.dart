import 'package:flutter/material.dart';

class ConstructorScreen extends StatelessWidget {
String message;

  ConstructorScreen(String m){
    this.message = m;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen with constructor data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Data received"), Text(message)],
        ),
      ),
    );
  }
}
