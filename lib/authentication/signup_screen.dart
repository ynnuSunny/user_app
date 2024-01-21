import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:user_app/authentication/login_screen.dart';
import 'package:user_app/methods/common_methods.dart';

import '../pages/home_page.dart';
import '../widgets/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkInternet(){
     cMethods.checkConnectivity(context);
     formAuthentication();
  }
  formAuthentication(){
     if(userNameTextEditingController.text.trim().length<3){
       cMethods.displaySnackBar("User name too short", context);
     }else if(!emailTextEditingController.text.contains("@")){
       cMethods.displaySnackBar("User email not valid", context);
     }else if(phoneTextEditingController.text.trim().length!=11){
       cMethods.displaySnackBar("User phone number not valid", context);
     }else if(passwordTextEditingController.text.trim().length<5){
       cMethods.displaySnackBar("User password too short", context);
     }else{
       registerNewUser();
     }
  }
  registerNewUser() async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => LoadingDialog(messageText: "Registering your account..."),
    );

    final User? userFirebase = (
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((errorMsg)
        {
          Navigator.pop(context);
          cMethods.displaySnackBar(errorMsg.toString(), context);
        })
    ).user;

    if(!context.mounted) return;
    Navigator.pop(context);

    DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userFirebase!.uid);
    Map userDataMap =
    {
      "name": userNameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "phone": phoneTextEditingController.text.trim(),
      "id": userFirebase.uid,
      "blockStatus": "no",
    };
    usersRef.set(userDataMap);

    Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [

              Image.asset("assets/images/logo.png"),
              const Text(
                "Create a User\'s Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              // text field + button
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller: userNameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "user name",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),

                        ),
                        style: const TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "user email",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),

                        ),
                        style: const TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "user phone",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),

                        ),
                        style: const TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          labelText: "user password",
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),

                        ),
                        style: const TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 12,),
                      ElevatedButton(
                          onPressed: (){
                            checkInternet();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                          ),

                        child: const Text("Sign Up"
                             , style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
              ),
              const SizedBox(height: 12,),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
                  },
                  child:  const Text(
                      "Already have an account",
                       style: TextStyle(
                         color: Colors.grey
                       ),

                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
