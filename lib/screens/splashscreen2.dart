import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/onboarding_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    navigateScreen();
    super.initState();
  }

  Future<void> navigateScreen() async {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushNamed(OnboardingScreen.routename);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: hextocolor('#f3f3f3'),
        child: Center(child: Image.asset('assets/images/jidetaiwo.gif')),
      ),
    );
  }
}
