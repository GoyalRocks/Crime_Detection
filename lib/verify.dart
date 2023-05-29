import 'package:crime_detection/phone_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPintheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPintheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    final submittedPinTheme = defaultPintheme.copyWith(
      decoration: defaultPintheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code="";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black87,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img1.png',
              width: 150,
              height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("we need to register your phone number before getting started!",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              Pinput(
                length: 6,
                onChanged: (value){
                  code=value;
                },
                showCursor: true,
                // ignore: avoid_print
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: () async{
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.
                      credential(
                          verificationId: MyPhone.verify, smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(context, "register",
                              (route) => true);
                    }
                    catch(e)
                    {
                      print("wrong OTP");
                    }
                  },
                  child: const Text("verify phone Number")),
              ),
                  Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, 
                          'phone', (route) => false,);
                    }, 
                        child: const Text(
                          "Edit Phone Number?",
                          style: TextStyle(color: Colors.black87),
                        ))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
