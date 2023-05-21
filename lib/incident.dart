import 'package:flutter/material.dart';

class Incident extends StatefulWidget {
  const Incident({Key? key}) : super(key: key);

  @override
  State<Incident> createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {

  List<String> items = <String>['Red','orange', 'blue', 'black'];
  String dropdownValue = 'Red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Report an Incident"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
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
              const SizedBox(height: 20,),
              Container(
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
            ],
          ),
        ),
      ),
    );

  }
}