import 'package:flutter/material.dart';

import 'package:new_flutter_app/widgets/LoginSignUpHeader.dart';
import 'package:new_flutter_app/widgets/alertDialog.dart';
import 'package:toast/toast.dart';

import '../database/DBHelper.dart';
import '../widgets/TextFormFields.dart';
import 'Signup.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});
 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey= GlobalKey<FormState>();
  
   final  _userId=TextEditingController();
   final  _password=TextEditingController();
   var dbHelper;

   
  @override
  void initState(){
    super.initState();
    dbHelper=DBHelper();
  }
   login() async {
    String uid = _userId.text;
    String password = _password.text;
    if(uid.isEmpty){
      alertDialog("Please Enter User id");
    }else if(password.isEmpty){
      alertDialog("Please Enter Password");
    }else{
      await dbHelper.getLoginUser(uid,password).then((userData){
       
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>const HomePage()),
        (Route<dynamic> route)=>false);
        alertDialog("Success Login");

      }).catchError((Error){
        print(Error);
        alertDialog("Error: Login failed!");

      });
    }

   }
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Login & Signup",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               LoginSignupHeader(headName: "Login",),
               TextFormWidget(
                controller: _userId,
                hintName: "User Id",
                icon: Icons.person,
               ),
                const SizedBox(
                  height: 10,
                ),
                TextFormWidget(
                controller: _password,
                hintName: "Password",
                icon: Icons.lock,
                isobscureText: true,
               ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 56, 48, 75)),
                    ),
                    onPressed: () {
                      login();
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ),
               const  SizedBox(
                  height: 10,
                ),
                Container(
                  padding:const  EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    
                    children: [
                      const Text(
                        "Does not have account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black54.withOpacity(0.1))),
                        onPressed: () {
                         Navigator.push(context,MaterialPageRoute(builder: (_)=>const SignupPage()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color:  Color.fromARGB(255, 56, 48, 75),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
