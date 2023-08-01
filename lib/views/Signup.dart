import 'package:flutter/material.dart';
import 'package:new_flutter_app/database/DBHelper.dart';
import 'package:new_flutter_app/model/UserModel.dart';

import 'package:new_flutter_app/widgets/LoginSignUpHeader.dart';
import 'package:new_flutter_app/widgets/alertDialog.dart';
import 'package:toast/toast.dart';

import '../widgets/TextFormFields.dart';
import 'Login.dart';
import 'home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey=new GlobalKey<FormState>();

  final _userId = TextEditingController();
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  var dbHelper;
  @override
  void initState(){
    super.initState();
    dbHelper=DBHelper();
  }

  signup() async {
    
    String uid = _userId.text;
    String uname = _userName.text;
    String email= _email.text;
    String password = _password.text;
    String cpassword = _confirmpassword.text;
    if(_formKey.currentState!.validate()){
      if (password != cpassword) {
      alertDialog("Please Try Again! \nNo Match above password and confirm password");
    }else{
      _formKey.currentState!.save();

      UserModel uModel=UserModel(uid, uname, email, password);
     await  dbHelper.saveUser(uModel).then((userData){
         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>const HomePage()),
        (Route<dynamic> route)=>false);
        alertDialog("Success Register!");

      }).catchError((Error){
        print(Error);
        alertDialog("Failed: Can not Save your info.");
      });
     
    }

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
                LoginSignupHeader(
                  headName: "SignUp",
                ),
                TextFormWidget(
                  controller: _userId,
                  hintName: "User Id",
                  icon: Icons.person_add_alt,
                ),
                TextFormWidget(
                  controller: _userName,
                  hintName: "User Name",
                  inputType: TextInputType.name,
                  icon: Icons.person,
                ),
                TextFormWidget(
                  controller: _email,
                  hintName: "Email",
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                TextFormWidget(
                  controller: _password,
                  hintName: "Password",
                  icon: Icons.lock,
                  isobscureText: true,
                ),
                TextFormWidget(
                  controller: _confirmpassword,
                  hintName: "Confirm Password",
                  icon: Icons.lock,
                  isobscureText: true,
                ),
                const SizedBox(
                  height: 5,
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
                      return signup();
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Does you have account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black54.withOpacity(0.1))),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Color.fromARGB(255, 56, 48, 75),
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
