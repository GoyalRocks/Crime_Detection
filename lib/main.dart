import 'package:crime_detection/home_page.dart';
import 'package:crime_detection/login.dart';
import 'package:crime_detection/phone_otp.dart';
import 'package:crime_detection/register.dart';
import 'package:crime_detection/verify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'verify' : (context) => const MyVerify(),
      'register': (context) => const MyRegister(),
      'phone': (context) => const MyPhone(),
      'login': (context) => const MyLogin(),
      'home': (context) => const Home(),
    },

  ));
}