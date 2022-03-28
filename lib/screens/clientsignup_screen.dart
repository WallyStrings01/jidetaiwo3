import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/clientlogin_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class ClientSignupScreen extends StatefulWidget {
  static const routename = '/clientsignuupscreen';
  ClientSignupScreen({Key? key}) : super(key: key);

  @override
  State<ClientSignupScreen> createState() => _ClientSignupScreenState();
}

class _ClientSignupScreenState extends State<ClientSignupScreen> {
  bool? checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('CLIENT SIGN UP', () {}),
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
              child: DropdownButtonFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: hextocolor('#FAFAFA'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              hint: Text(
                'Account type',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
              ),
              isExpanded: true,
              items: [
                'Account type 1',
                'Account type 2',
                'Account type 3',
                'Account type 4',
                'Account type 5',
                'Account type 6'
              ].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: hextocolor('#5E5B5B')),
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            )
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  alignLabelWithHint: true,
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
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 5,
                maxLines: null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                        ),
                    children: [
                  TextSpan(
                      text: 'Security code',
                      style: TextStyle(color: hextocolor('#C4C4C4'))),
                  TextSpan(text: '  '),
                  TextSpan(
                      text: 'What is 10 * 4 ?',
                      style: TextStyle(color: hextocolor('#5E5B5B')))
                ])),
            SizedBox(
              height: 5,
            ),
            Container(
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
            RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                  children: [
                    TextSpan(text: 'Already have an account ? Click '),
                    TextSpan(
                        text: 'Here',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context)
                              .pushNamed(ClientLoginScreen.routename),
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    TextSpan(text: ' to Log In')
                  ]),
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
                Text(
                  'I AGREE TO THESE',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                      ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
