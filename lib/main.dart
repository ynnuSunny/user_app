import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_app/authentication/login_screen.dart';
import 'package:user_app/authentication/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyAEXFnm_-Bh2IO7RfZuhtEVmi1kSXvQCbQ",
            appId: "1:737563871705:android:a86f1ab473df9e1fd371c8",
            messagingSenderId: "737563871705",
            projectId: "uber-clone-583a0",
          ),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const LoginScreen(),
    );
  }
}
