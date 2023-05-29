import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //we use future to go from one screen to other via duration time
    Future.delayed(const Duration(seconds: 10), (){
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen;
      Navigator.pushNamedAndRemoveUntil(context, 'phone', (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    //scaffold color set to primary color in main in our text theme
    return Scaffold(
      backgroundColor: const Color(0xff1d5b84),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/welcome2.png',
              height: 50.h,
              width: 100.w,
            ),
            Text('Crime', style: Theme.of(context).textTheme.headlineLarge,),
            Text('Detection', style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}