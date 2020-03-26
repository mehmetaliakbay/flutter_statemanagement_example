import 'dart:async';

import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    _streamController.close();
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
            StreamBuilder<int>(
                initialData: 0,
                stream: _streamController.stream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _streamController.sink.add(++_counter);
            },
            heroTag: "btn2",
            tooltip: 'deneme',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _streamController.sink.add(--_counter);
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
