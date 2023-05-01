import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void requestPermission()async{
    var status  = await Permission.storage.status;
    if(!status.isGranted)
      {
        await Permission.storage.request();
      }
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
