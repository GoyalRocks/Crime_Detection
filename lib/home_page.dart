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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Home"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox.fromSize(
                    size: const Size(100, 100),
                    child: ClipOval(
                      child: Material(
                        color: Colors.blueAccent,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Navigator.pushNamed(context, 'video');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.stream, size: 50,), // <-- Icon
                              Text("Go Live"), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  SizedBox.fromSize(
                    size: const Size(100, 100),
                    child: ClipOval(
                      child: Material(
                        color: Colors.blueAccent,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.location_on_outlined, size: 40,), // <-- Icon
                              Text("Locate\nLocation"), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30,),
                  SizedBox.fromSize(
                    size: const Size(100, 100),
                    child: ClipOval(
                      child: Material(
                        color: Colors.blueAccent,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.policy_outlined, size: 40,), // <-- Icon
                              Text("Report\nIncident"), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
