import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/services/UserRepository.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = Provider.of<UserRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('email ${userRepository.user.email}'),
            RaisedButton(
                onPressed: () {
                  userRepository.signOut();
                },
                child: Text('Sign out'),
                color: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
