import 'package:crime_detection/notification.dart';
import 'package:crime_detection/sos.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;

  final screens = [
    Home(),
    SOS(),
    Notifications(),
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blue.shade200,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30,),
              label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sos,size: 30,),
            label: 'SoS'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_on,size: 30,),
              label: 'Notification'
          ),
        ]
      ),
      backgroundColor: Colors.white,
      body:
      Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
        child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, 'video');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                              image: const AssetImage('assets/instagram_live.png'),
                            height: 22.h,
                            width: 45.w,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 6,),
                          const Text('Go Live',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 3,),
                        ],
                      )
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, 'map');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage('assets/Navigation.png'),
                              height: 22.h,
                              width: 45.w,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 3,),
                            const Text('Track My \nLocation',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6,),
                          ],
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, 'incident');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage('assets/incident.jpg'),
                              height: 22.h,
                              width: 45.w,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 3,),
                            const Text('Report an Incident',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6,),
                          ],
                        )
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, 'map');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage('assets/Emergency_call.png'),
                              height: 22.h,
                              width: 45.w,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 3,),
                            const Text('Emergency calls',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6,),
                          ],
                        )
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
