import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class ClientSignupScreen extends StatefulWidget {
  ClientSignupScreen({Key? key}) : super(key: key);

  @override
  State<ClientSignupScreen> createState() => _ClientSignupScreenState();
}

class _ClientSignupScreenState extends State<ClientSignupScreen> {
  bool? checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('CLIENT SIGN UP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: ListView(
          children: [
            Text(
              'Please fill in the following to Sign Up',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full name',
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
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mobile number',
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
              height: 48,
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
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Account Type',
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
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
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
              height: 48,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter the security code shown above',
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
              height: 40,
            ),
            ElevatedButtonWidget(
                width: double.infinity,
                height: 51,
                buttonText: 'Sign Up',
                borderRadius: 8,
                ontap: () {},
                textColor: Colors.white,
                bgColor: Theme.of(context).primaryColor),
            SizedBox(
              height: 15,
            ),
            Text(
              'Already have an account ? Click Here to Log In',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '* Terms and Conditions *',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please read these terms and conditions carefully before registering for Our Service.',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'TERMS AND CONDITIONS',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    value: checkboxValue,
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    tristate: false,
                    onChanged: (value) {
                      setState(() {
                        checkboxValue = value;
                      });
                    }),
                Text('I AGREE TO THESE', style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),)
              ],
            )
          ],
        )),
      ),
    );
  }
}
