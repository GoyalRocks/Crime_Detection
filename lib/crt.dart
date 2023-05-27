import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class CRT extends StatefulWidget {


  final String userId;
  const CRT(this.userId, {super.key});

  @override
  State<CRT> createState() => _CRTState();
}

class _CRTState extends State<CRT> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('location').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(_added)
              {
                crt(snapshot);
              }
            if(!snapshot.hasData)
            {
              return const Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              mapType: MapType.normal,
              markers: {
                Marker(
                  position: LatLng(
                    snapshot.data!.docs.singleWhere(
                            (element) => element.id==widget.userId)['latitude'],
                    snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitude'],
                  ),
                  markerId: const MarkerId('id'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta))
              },
              initialCameraPosition: CameraPosition(
              target: LatLng(
                  snapshot.data!.docs.singleWhere(
                          (element) => element.id==widget.userId)['latitude'],
                snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitude'],
              ),
                  zoom: 14.47
            ),
              onMapCreated: (GoogleMapController controller)async {
                setState(() {
                  _controller = controller;
                  _added = true;
                });
              },
            );
          },
        ),
    );
  }
  
  Future<void> crt(AsyncSnapshot<QuerySnapshot> snapshot) async{
    await _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:  LatLng(
      snapshot.data!.docs.singleWhere(
              (element) => element.id==widget.userId)['latitude'],
      snapshot.data!.docs.singleWhere((element) => element.id == widget.userId)['longitude'],
    ),
      zoom: 14.47
    )));
  }
}
