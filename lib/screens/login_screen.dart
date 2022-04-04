import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/provider/client_dashboard_provider.dart';
import 'package:jidetaiwoapp/screens/agent_dashboard_screen.dart';
import 'package:jidetaiwoapp/screens/client_dashboard_screen.dart';
import 'package:jidetaiwoapp/screens/signup_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routename = '/loginscreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;
  String? appbarText = 'agent';
  final _formkey = GlobalKey<FormState>();

  Future<void> loginUser() async {
    final isvalid = _formkey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _formkey.currentState!.save();
    setState(() {
      isloading = true;
    });
    if (appbarText == 'client') {
      await Provider.of<ClientDashboardProvider>(context, listen: false)
          .fetchClientDashboardInformation();
      setState(() {
        isloading = false;
      });
      Navigator.of(context).pushNamed(ClientDashboardScreen.routename);
    } else {
      Navigator.of(context).pushNamed(AgentdashboardScreen.routename);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.red)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'field cannot be empty';
          }
          if (label.trim().toLowerCase() == 'password' && value.length < 4) {
            return 'password too short';
          }
          return null;
        },
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) =>
              AppBarWidget('${appbarText!.toUpperCase()} LOGIN'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formkey,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  'Please fill in the following to Sign Up',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16),
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
                isloading
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            minimumSize: Size(double.infinity, 51)),
                        onPressed: () {},
                        child: Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ))
                    : ElevatedButtonWidget(
                        width: double.infinity,
                        height: 51,
                        buttonText: 'Login',
                        borderRadius: 8,
                        ontap: loginUser,
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
                              ..onTap = () => Navigator.of(context).pushNamed(
                                  SignupScreen.routename,
                                  arguments: appbarText),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                        const TextSpan(text: ' to Sign Up')
                      ]),
                )
              ],
            )),
      ),
    );
  }
}
