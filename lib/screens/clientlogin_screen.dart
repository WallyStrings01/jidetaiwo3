import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/clientsignup_screen.dart';
import 'package:jidetaiwoapp/screens/mydashboardscreen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class ClientLoginScreen extends StatelessWidget {
  static const routename = '/clientloginscreen';
  const ClientLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('CLIENT LOGIN', () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text(
              'Please fill in the following to Sign Up',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
                  filled: true,
                  fillColor: hextocolor('#FAFAFA'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
                  filled: true,
                  fillColor: hextocolor('#FAFAFA'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButtonWidget(
                width: double.infinity,
                height: 51,
                buttonText: 'Login',
                borderRadius: 8,
                ontap: () {
                  Navigator.of(context).pushNamed(MydashboardScreen.routename);
                },
                textColor: Colors.white,
                bgColor: Theme.of(context).primaryColor),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                  children: [
                    TextSpan(text: 'New user ? Click '),
                    TextSpan(
                        text: 'Here',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context)
                              .pushNamed(ClientSignupScreen.routename),
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    TextSpan(text: ' to Sign Up')
                  ]),
            )
          ],
        )),
      ),
    );
  }
}
