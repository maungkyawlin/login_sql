// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LoginSignupHeader extends StatelessWidget {
  String? headName;
   LoginSignupHeader({super.key,this.headName});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      const SizedBox(height: 50,),
        Text(
                headName!,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Simple Code",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
              const SizedBox(
                height: 10,
              ),
    ],),);
  }
}