import 'dart:async';

import 'package:calling_app/Screen/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                viewpage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 165,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 500,
                  width: 500,
                  child: Lottie.asset("lotti/calling.json"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 475),
                  child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                        width: 300,
                        height: 15,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Color(
                                0xFF2C8525)),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
