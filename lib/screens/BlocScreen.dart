import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/bloc/counter/counter_bloc.dart';
import 'package:flutter_statemanagement/bloc/counter/counter_event.dart';

class BlocScreen extends StatefulWidget {
  @override
  _BlocScreenState createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  final _counterBloc = CounterBloc();

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
            StreamBuilder(
              initialData: 0,
              stream: _counterBloc.counterStateStream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 48),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _counterBloc.counterEventSink.add(IncrementEvent());
            },
            heroTag: "btn2",
            tooltip: 'deneme',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.counterEventSink.add(DecrementEvent());
            },
            heroTag: "btn1",
            tooltip: 'deneme2',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
