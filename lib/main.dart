import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gem/firebase_options.dart';
import 'package:gem/screens/home_screen.dart';
import 'package:gem/screens/qr_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
Future<void> main() async {
  runApp(const MyApp());
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: const HomeScreen(),
    );
  }
}
