import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Incident extends StatefulWidget {
  const Incident({Key? key}) : super(key: key);

  @override
  State<Incident> createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {

  File? pickedImage;
  List<String> items = <String>['Red','orange', 'blue', 'black'];
  String dropdownValue = 'Red';

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Report an Incident"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 14, top: 5),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                              hint: const Text('Select State'),
                              value: dropdownValue,
                              icon: (null),
                              iconSize: 30,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20),
                              items: items.map<DropdownMenuItem<String>>(
                                    (String value){
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue){
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              }),
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                                hint: const Text('Select city:'),
                                value: dropdownValue,
                                icon: (null),
                                iconSize: 30,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,),
                                items: items.map<DropdownMenuItem<String>>(
                                      (String value){
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? newValue){
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                }),
                          ),

                        ))
                      ]
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
                  color: Colors.grey,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                                hint: const Text('Select Category:'),
                                value: dropdownValue,
                                icon: (null),
                                iconSize: 30,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,),
                                items: items.map<DropdownMenuItem<String>>(
                                      (String value){
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? newValue){
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                }),
                          ),
                        ))
                      ]
                  ),
                ),
                const SizedBox(height: 20,),Container(
                    width: MediaQuery. of(context). size. width,
                    color: Colors.white,
                    child: TextField(
                      style: const TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 12),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Information',
                      ),
                    ),
                  ),
                const SizedBox(height: 20,),
                Container(
                    width: MediaQuery. of(context). size. width,
                    color: Colors.white,
                    child: TextField(
                      style: const TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Name, Contact No° (mandatory)',
                      ),
                    ),
                  ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.indigo,width: 5),
                              borderRadius: const BorderRadius.all(Radius.circular(100),),
                            ),
                            child: ClipOval(
                              child: pickedImage!=null ?
                              Image.file(pickedImage!,width: 170,height: 170,fit: BoxFit.cover,) :
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: IconButton(
                              onPressed: imagePickerOption,
                              icon: const Icon(Icons.add_a_photo_outlined,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Padding(padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton.icon(
                        onPressed: imagePickerOption,
                        icon: const Icon(Icons.add_a_photo_sharp),
                        label: const Text('Upload Image')),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){

                },
                    child: const Text(
                      'Send Information',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                )
              ],
            ),
          ),
        ),
      )
    );

  }
}