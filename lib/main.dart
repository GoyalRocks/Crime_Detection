import 'package:crime_detection/home_page.dart';
import 'package:crime_detection/incident.dart';
import 'package:crime_detection/login.dart';
import 'package:crime_detection/map.dart';
import 'package:crime_detection/notification.dart';
import 'package:crime_detection/phone_otp.dart';
import 'package:crime_detection/real_time_face_detection.dart';
import 'package:crime_detection/register.dart';
import 'package:crime_detection/sos.dart';
import 'package:crime_detection/splash.dart';
import 'package:crime_detection/verify.dart';
import 'package:crime_detection/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Sizer(builder: (context,orientation,device)
    {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crime Detection',
        home: const SplashScreen(),
        routes: {
          'verify' : (context) => const MyVerify(),
          'register': (context) => const MyRegister(),
          'phone': (context) => const MyPhone(),
          'login': (context) => const MyLogin(),
          'home': (context) => const Home(),
          'video': (context) => const Video(),
          'incident': (context)=> const Incident(),
          'sos': (context)=> const SOS(),
          'map': (context)=> const MyMap(),
          'welcome': (context)=> const WelcomeScreen(),
          'splash': (context)=> const SplashScreen(),
          'notification':(context)=> const Notifications(),
        },

      );
    });
  }
}
