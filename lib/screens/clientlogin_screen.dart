import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class ClientLoginScreen extends StatelessWidget {
  const ClientLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('CLIENT LOGIN'),
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
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                          fontSize: 16, color: hextocolor('#C4C4C4')),
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
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                          fontSize: 16, color: hextocolor('#C4C4C4')),
                  filled: true,
                  fillColor: hextocolor('#FAFAFA'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 60,),
            ElevatedButtonWidget(
            width: double.infinity,
            height: 51,
            buttonText: 'Login',
            borderRadius: 8,
            ontap: () {},
            textColor: Colors.white,
            bgColor: Theme.of(context).primaryColor),
            SizedBox(
              height: 15,
            ),
        Text(
          'New user ? Click Here to Sign Up',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 18),
        ),
          ],
        )),
      ),
    );
  }
}

