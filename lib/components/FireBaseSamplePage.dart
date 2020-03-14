import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/screens/LoadingScreen.dart';
import 'package:flutter_statemanagement/screens/LoginScreen.dart';
import 'package:flutter_statemanagement/screens/UserScreen.dart';
import 'package:flutter_statemanagement/services/UserRepository.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class FireBaseSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, UserRepository userRepository, child) {
      switch (userRepository.condition) {
        case UserCondition.SessionIdle:
          return LoadingScreen();
        case UserCondition.SessionOpening:
        case UserCondition.SessionNotOpen:
          return LoginScreen();
        case UserCondition.SessionOpen:
          return UserScreen();
      }
    });
  }
}
