import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int percent = 0;
  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer?.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image(
                image: AssetImage('assets/images/jidetaiwo.png'),
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(3),
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          )),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext ctx, BoxConstraints constraint) =>
                                Container(
                          height: 20,
                          width: constraint.maxWidth * (percent / 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
