import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SizedBox(
        width: 50.w,
        height: 50.h,),
    );
  }
}
