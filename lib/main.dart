import 'package:crime_detection/home_page.dart';
import 'package:crime_detection/incident.dart';
import 'package:crime_detection/login.dart';
import 'package:crime_detection/phone_otp.dart';
import 'package:crime_detection/real_time_face_detection.dart';
import 'package:crime_detection/register.dart';
import 'package:crime_detection/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'incident',
    routes: {
      'verify' : (context) => const MyVerify(),
      'register': (context) => const MyRegister(),
      'phone': (context) => const MyPhone(),
      'login': (context) => const MyLogin(),
      'home': (context) => const Home(),
      'video': (context) => const Video(),
      'incident': (context)=> const Incident(),
    },

  ),
  );
}