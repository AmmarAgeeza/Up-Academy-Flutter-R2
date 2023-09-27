import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.email, required this.password});
final String email;
final String password;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child:  Text(email+password)),
      ),
    );
  }
}
