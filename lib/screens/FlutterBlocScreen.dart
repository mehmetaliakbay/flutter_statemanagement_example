import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/bloc/counter/counter_bloc.dart';
import 'package:flutter_statemanagement/bloc/counter/counter_event.dart';

class FlutterBlocScreen extends StatefulWidget {
  @override
  _FlutterBlocScreenState createState() => _FlutterBlocScreenState();
}

class _FlutterBlocScreenState extends State<FlutterBlocScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding and Subtracting The Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adding and Subtracting The Counter',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
            heroTag: "btn2",
            tooltip: 'deneme',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: "btn1",
            tooltip: 'deneme2',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
