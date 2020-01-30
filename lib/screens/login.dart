import 'package:flutter/material.dart';

Widget defaultTextField(IconData icon){
  return TextField(
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

Widget defaultButton() {
  return MaterialButton(
    padding: EdgeInsets.all(20.0),
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: Colors.purple,
    child: Text("Entrar", style: TextStyle(color: Colors.white),), 
    onPressed: (){
      
    },
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            defaultTextField(Icons.email),
            SizedBox(height: 10,),
            defaultTextField(Icons.security),
            SizedBox(height: 10,),
            defaultButton()
          ],
        ),
      ),
    );
  }
}