import 'package:adhara_test/services/auth.dart';
import 'package:adhara_test/models/login_form.dart';
import 'package:adhara_test/widgets/default_button.dart';
import 'package:adhara_test/widgets/default_textfield.dart';
import 'package:flutter/material.dart';

Widget defaultTextField({Function(String) onChanged, IconData icon, bool isHidden: false, 
  TextEditingController controller}){
  return TextField(
    controller: controller,
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
            DefaultTextField(onChanged: loginForm.changeEmail, icon: Icons.email),
            SizedBox(height: 10,),
            DefaultTextField(onChanged: loginForm.changePassword, icon: Icons.security, isHidden: true),
            SizedBox(height: 10,),
            DefaultButton(onPressed: () async {
              await Auth.login(email: loginForm.email,password: loginForm.password);
            }, title: "Entrar")
          ],
        ),
      ),
    );
  }
}