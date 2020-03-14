import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/models/Letter.dart';
import 'package:provider/provider.dart';

class ProviderSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //NOTE  First way
    final myLetter = Provider.of<Letter>(context);
    //NOTE Second way
    return Consumer(
        builder: (context, Letter myLetter2, widget) => Scaffold(
              appBar: AppBar(
                title: Text("Insert Delete A Random String"),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Insert Delete A Random String',
                    ),
                    Text(
                      '${myLetter.letter}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      myLetter.addLetter();
                    },
                    heroTag: "btn2",
                    tooltip: 'deneme',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      myLetter2.subLetter();
                    },
                    heroTag: "btn1",
                    tooltip: 'deneme2',
                    child: Icon(Icons.android),
                  )
                ],
              ),
            ));
  }
}
