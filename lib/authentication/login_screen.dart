import 'package:flutter/material.dart';
import 'package:user_app/authentication/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
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
                "Login Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              // text field + button
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
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

                      child: const Text("Login"
                        , style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>SignUpScreen()));
                },
                child:  const Text(
                  "Create an account",
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
