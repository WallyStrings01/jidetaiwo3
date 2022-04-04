import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/login_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class SignupScreen extends StatefulWidget {
  static const routename = '/signuupscreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? checkboxValue = false;
  final _formkey = GlobalKey<FormState>();

  void signupUser() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState!.save();
  }

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
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbarText = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) =>
              AppBarWidget('${appbarText.toUpperCase()} SIGN UP'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                Text(
                  'Please fill in the following to Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                _inputForm('Full name'),
                const SizedBox(
                  height: 20,
                ),
                _inputForm('Mobile number'),
                const SizedBox(
                  height: 20,
                ),
                _inputForm('Email'),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: hextocolor('#FAFAFA'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.white)),
                  ),
                  iconEnabledColor: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16, color: hextocolor('#5E5B5B')),
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 5,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _inputForm('Password'),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButtonWidget(
                    width: double.infinity,
                    height: 51,
                    buttonText: 'Sign Up',
                    borderRadius: 8,
                    ontap: signupUser,
                    textColor: Colors.white,
                    bgColor: Theme.of(context).primaryColor),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18),
                      children: [
                        const TextSpan(
                            text: 'Already have an account ? Click '),
                        TextSpan(
                            text: 'Here',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed(LoginScreen.routename),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                        const TextSpan(text: ' to Log In')
                      ]),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Please read these terms and conditions carefully before registering for Our Service.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
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
                const SizedBox(height: 10),
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
