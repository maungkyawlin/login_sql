// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_flutter_app/widgets/alertDialog.dart';


@immutable
 class TextFormWidget extends StatelessWidget {
  TextEditingController? controller;
  String? hintName;
  bool? isobscureText;
  IconData? icon;
  TextInputType? inputType;
   TextFormWidget({super.key, this.controller,this.hintName,this.icon,this.isobscureText=false,this.inputType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: controller,
                  obscureText: isobscureText!,
                  keyboardType: inputType,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please Enter $hintName';
                    }
                    if(hintName=='Email'&& !validateEmail(value)){
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                  onSaved: (val)=>controller?.text=val!,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blueGrey)),
                      prefixIcon: Icon(icon),
                      labelText: hintName,
                      hintText:hintName,
                      fillColor: Colors.grey[200]),
                ),
              );
  }
}