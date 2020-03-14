import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/services/UserRepository.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _email;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepository = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _email,
                  validator: (val) {
                    if (val.length <= 0)
                      return "Please fill the password field";
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _password,
                  validator: (val) {
                    if (val.length <= 0) return "Please fill the email field";
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              userRepository.condition == UserCondition.SessionOpening
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (!await userRepository.signIn(
                                _email.text, _password.text)) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      "Email ve Sifre FireBasedeki ile ayni degil")));
                            }
                          }
                        },
                        child: Text('Login'),
                        color: Colors.green,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () async {
                    userRepository.signWithGoogle();
                  },
                  child: Text('Sign in with Google'),
                  color: Colors.deepPurpleAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
