import 'package:flutter/material.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({Key? key}) : super(key: key);

  static String name="";
  static String userId="";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
              elevation: 0,
          ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                'create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.28
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              onChanged: (value){
                                name = value;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              onChanged: (value){
                                userId = value;
                              },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "UserId",
                              hintStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black),
                                  ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black
                                ),
                              ),
                              hintText: "password",
                              hintStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: const Color(0xff4c505b),
                                    child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'welcome');
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      ),
                                    ),
                                  )
                                ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                    style: const ButtonStyle(),
                                    child: const Text(
                                      'sign In',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 18
                                      ),
                                    ),
                                  ),
                                ],
                            )
                          ],
                        ),
                    )
                  ],
                ),
              ),
            )
          ],
      )
      )
    );
  }
}
