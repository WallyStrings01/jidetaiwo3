import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/signup_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  static const routename = '/loginscreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbarText = ModalRoute.of(context)!.settings.arguments as String;
    Widget _inputForm(String label) {
      return TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
          filled: true,
          fillColor: hextocolor('#FAFAFA'),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('${appbarText.toUpperCase()} LOGIN', () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              'Please fill in the following to Sign Up',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            _inputForm('Email'),
            const SizedBox(
              height: 20,
            ),
            _inputForm('Password'),
            const SizedBox(
              height: 60,
            ),
            ElevatedButtonWidget(
                width: double.infinity,
                height: 51,
                buttonText: 'Login',
                borderRadius: 8,
                ontap: () {},
                textColor: Colors.white,
                bgColor: Theme.of(context).primaryColor),
            const SizedBox(
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                  children: [
                    const TextSpan(text: 'New user ? Click '),
                    TextSpan(
                        text: 'Here',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context)
                              .pushNamed(SignupScreen.routename, arguments: appbarText),
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    const TextSpan(text: ' to Sign Up')
                  ]),
            )
          ],
        )),
      ),
    );
  }
}
