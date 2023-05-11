import 'package:crime_detection/livestream.dart';
import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  var host=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Going Live"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("host", style: TextStyle(
                fontSize: 30
              ),),
              Checkbox(value: host, onChanged: (value){
                setState(() {
                  host=value!;
                });
              })
            ],
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            MyLive(liveID: "1", isHost: host)));
          }, child: const Text("Start"))
        ],
      ),
    );
  }
}
