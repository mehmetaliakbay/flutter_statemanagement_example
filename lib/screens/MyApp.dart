import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('State Management')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/a');
                },
                child: Text("Provider Simple Page"),
                color: Colors.amber,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                },
                child: Text("Provider With Firebase"),
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
