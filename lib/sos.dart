import 'package:flutter/material.dart';

class SOS extends StatefulWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  State<SOS> createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('SOS',style: TextStyle(color: Colors.white),),
      ),
      body: Container(

      ),
    );
  }
}
