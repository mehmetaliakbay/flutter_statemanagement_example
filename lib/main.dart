import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/components/FireBaseSamplePage.dart';
import 'package:flutter_statemanagement/services/UserRepository.dart';
import 'package:provider/provider.dart';
import 'models/Letter.dart';
import 'screens/ProviderSamplePage.dart';
import 'screens/MyApp.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Letter>(
        create: (context) => Letter("Mehmet Ali"),
      ),
      ChangeNotifierProvider<UserRepository>(
        create: (context) => UserRepository(),
      ),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MyApp(),
        '/a': (BuildContext context) => ProviderSamplePage(),
        '/b': (BuildContext context) => FireBaseSamplePage(),
      },
    ),
  ));
}
