import 'package:flutter/material.dart';
import 'package:user_app/authentication/login_screen.dart';

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
                        style: TextStyle(
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
                          onPressed: (){},
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
