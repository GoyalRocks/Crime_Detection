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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const UserAccountsDrawerHeader(accountName: Text('Harsh Goyal'), accountEmail: Text('harshgoyal8nov2001@gmail.com'),decoration: BoxDecoration(color: Colors.blueAccent),
            currentAccountPicture: CircleAvatar(radius: 50.0,
              backgroundColor: Color(0xFF778899),
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg'),
            ),),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('Account'),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text('Contact US'),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: (){},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
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
                          splashColor: Colors.black54,
                          onTap: () {
                            Navigator.pushNamed(context, 'video');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.stream, size: 50,color: Colors.white,), // <-- Icon
                              Text("Go Live",style: TextStyle(color: Colors.white),), // <-- Text
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
                          splashColor: Colors.black54,
                          onTap: () {
                            Navigator.pushNamed(context, 'map');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.location_on_outlined, size: 40,color: Colors.white,), // <-- Icon
                              Text("Locate\nLocation",style: TextStyle(color: Colors.white),), // <-- Text
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
                          splashColor: Colors.black54,
                          onTap: () {
                            Navigator.pushNamed(context, 'incident');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.policy_outlined, size: 40,color: Colors.white,), // <-- Icon
                              Text("Report\nIncident",style: TextStyle(color: Colors.white),), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
               Row(
                  children: [
                    SizedBox.fromSize(
                      size: const Size(100, 100),
                      child: ClipOval(
                        child: Material(
                          color: Colors.blueAccent,
                          child: InkWell(
                            splashColor: Colors.black54,
                            onTap: () {
                              Navigator.pushNamed(context, 'sos');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.sos_rounded, size: 60,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          )
        ),
      ),
    );
  }
}
