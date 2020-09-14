import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/services.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    auth.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/topics');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(
              'WELCOME TO OPENDOOR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)
            ),

            Container(
              margin: EdgeInsets.only(top: 200),
                child: Text(
                    'HELLO STUDENT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black))),
            Container(
              margin: EdgeInsets.only(bottom: 10),
                child: Text(
                    'YOU PASSED THE VIBE CHECK',
                    style: TextStyle(fontSize: 18, color: Colors.black))),

            LoginButton(
              text: 'SIGN IN WITH GOOGLE',
              icon: FontAwesomeIcons.google,
              color: Colors.blueAccent,
              loginMethod: auth.googleSignIn,
            ),

            LoginButton(
              text: 'PROCEED AS GUEST',
              color: Colors.deepOrange,
              loginMethod: auth.anonLogin,
            ),

          ],
        ),
      ),
    );
  }
}

/// A resuable login button for multiple auth methods
class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key key, this.text, this.icon, this.color, this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/topics');
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
