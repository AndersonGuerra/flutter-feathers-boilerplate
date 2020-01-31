import 'package:adhara_test/services/auth.dart';
import 'package:adhara_test/models/login_form.dart';
import 'package:flutter/material.dart';

Widget defaultTextField(Function(String) onChanged, IconData icon, {bool isHidden: false}){
  return TextField(
    onChanged: onChanged,
    obscureText: isHidden,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      )
    ),
  );
}

Widget defaultButton({Function onPressed}) {
  return MaterialButton(
    padding: EdgeInsets.all(20.0),
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: Colors.purple,
    child: Text("Entrar", style: TextStyle(color: Colors.white),), 
    onPressed: onPressed,
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final LoginForm loginForm = LoginForm();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            defaultTextField(loginForm.changeEmail, Icons.email),
            SizedBox(height: 10,),
            defaultTextField(loginForm.changePassword, Icons.security, isHidden: true),
            SizedBox(height: 10,),
            defaultButton(onPressed: () async {
              await Auth.login(email: loginForm.email,password: loginForm.password);
            })
          ],
        ),
      ),
    );
  }
}