import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/model/agent_model.dart';
import 'package:jidetaiwoapp/model/client_model.dart';
import 'package:jidetaiwoapp/provider/agent_provider.dart';
import 'package:jidetaiwoapp/provider/client_provider.dart';
import 'package:jidetaiwoapp/screens/login_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class SignupScreen extends StatefulWidget {
  static const routename = '/signuupscreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final firstNumber = Random().nextInt(20);
  final secondNumber = Random().nextInt(20);
  bool? checkboxValue = false;
  final _formkey = GlobalKey<FormState>();
  String _passwordcontroller = '';
  bool showError = false;
  String errorMessage = '';
  bool isLoading = false;
  bool _obscurepassword = true;
  final List<String> _dropDownList = [
    'Enquiry',
    'Property Owner (landlord)',
    'Estate agent',
    'Company',
    'Tenant',
    'New Client',
    'Valuation Client or proxy',
    'Developer'
  ];
  Client _client = Client(
      clientId: '',
      clientName: '',
      phoneNumber: '',
      emailAddress: '',
      clientCategory: null,
      clientAddress: '',
      clientDistrict: '',
      clientState: '');

  Agent _agent = Agent(
      clientId: '',
      clientName: '',
      clientMobileNumber: '',
      clientEmail: '',
      branchIncharge: '',
      clientCategory: null,
      clientAddress: '',
      clientDistrict: '',
      clientState: '');

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void signupUser(String appbarText) async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState!.save();
    setState(() {
      isLoading = true;
    });
    if (checkboxValue == false) {
      errorMessage =
          'You have to agree to our terms and condition before you can sign up';
    } else {
      errorMessage = '';
      try {
        if (appbarText.toLowerCase() == 'client') {
          await Provider.of<Clientprovider>(context, listen: false)
              .signupUser(_client, _passwordcontroller);
        } else {
          await Provider.of<Agentprovider>(context, listen: false)
              .signupUser(_agent, _passwordcontroller);
        }
      } catch (error) {
        if (error.toString().contains('HttpException')) {
          final extractedMessage = error.toString().split('HttpException: ')[1];
          if (extractedMessage.trim() == 'EMAIL_EXISTS') {
            errorMessage = 'Email already exist, try another email address';
          }
        } else {
          errorMessage = 'An error occurred, try again later';
        }
      }
    }
    setState(() {
      showError = true;
      isLoading = false;
    });
  }

  Widget _inputForm(
      String appbarText, String label, TextEditingController controller) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
          filled: true,
          fillColor: hextocolor('#FAFAFA'),
          suffixIcon: label.toLowerCase() == 'password'
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _obscurepassword = !_obscurepassword;
                    });
                  },
                  icon: Icon(_obscurepassword
                      ? Icons.visibility_off
                      : Icons.visibility))
              : null,
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
              borderSide: const BorderSide(color: Colors.blue)),
        ),
        obscureText: _obscurepassword,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'field cannot be empty';
          }
          return null;
        },
        onChanged: (value) {
          if (appbarText.toLowerCase() == 'client') {
            _client = Client(
                clientId: _client.clientId,
                clientName: label.toString().toLowerCase() == 'full name'
                    ? value
                    : _client.clientName,
                phoneNumber: label.toString().toLowerCase() == 'mobile number'
                    ? value
                    : _client.phoneNumber,
                emailAddress: label.toString().toLowerCase() == 'email'
                    ? value
                    : _client.emailAddress,
                clientCategory: _client.clientCategory,
                clientAddress: _client.clientAddress,
                clientDistrict: _client.clientDistrict,
                clientState: _client.clientState);
            if (label.toString().toLowerCase() == 'password') {
              _passwordcontroller = value.toString();
            }
          } else {
            _agent = Agent(
                clientId: _agent.clientId,
                clientName: label.toString().toLowerCase() == 'full name'
                    ? value
                    : _agent.clientName,
                clientMobileNumber:
                    label.toString().toLowerCase() == 'mobile number'
                        ? value
                        : _agent.clientMobileNumber,
                clientEmail: label.toString().toLowerCase() == 'email'
                    ? value
                    : _agent.clientEmail,
                branchIncharge: _agent.branchIncharge,
                clientCategory: _agent.clientCategory,
                clientAddress: _agent.clientAddress,
                clientDistrict: _agent.clientDistrict,
                clientState: _agent.clientState);
            if (label.toString().toLowerCase() == 'password') {
              _passwordcontroller = value.toString();
            }
          }
        },
        onSaved: (value) {
          if (appbarText.toLowerCase() == 'client') {
            _client = Client(
                clientId: _client.clientId,
                clientName: label.toString().toLowerCase() == 'full name'
                    ? value
                    : _client.clientName,
                phoneNumber: label.toString().toLowerCase() == 'mobile number'
                    ? value
                    : _client.phoneNumber,
                emailAddress: label.toString().toLowerCase() == 'email'
                    ? value
                    : _client.emailAddress,
                clientCategory: _client.clientCategory,
                clientAddress: _client.clientAddress,
                clientDistrict: _client.clientDistrict,
                clientState: _client.clientState);
            if (label.toString().toLowerCase() == 'password') {
              _passwordcontroller = value.toString();
            }
          } else {
            _agent = Agent(
                clientId: _agent.clientId,
                clientName: label.toString().toLowerCase() == 'full name'
                    ? value
                    : _agent.clientName,
                clientMobileNumber:
                    label.toString().toLowerCase() == 'mobile number'
                        ? value
                        : _agent.clientMobileNumber,
                clientEmail: label.toString().toLowerCase() == 'email'
                    ? value
                    : _agent.clientEmail,
                branchIncharge: _agent.branchIncharge,
                clientCategory: _agent.clientCategory,
                clientAddress: _agent.clientAddress,
                clientDistrict: _agent.clientDistrict,
                clientState: _agent.clientState);
            if (label.toString().toLowerCase() == 'password') {
              _passwordcontroller = value.toString();
            }
          }
        });
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
                if (showError == true)
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            errorMessage.toString(),
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                _inputForm(
                    appbarText,
                    'Full name',
                    TextEditingController(
                        text: appbarText.toLowerCase() == 'client'
                            ? _client.clientName
                            : _agent.clientName)),
                const SizedBox(
                  height: 20,
                ),
                _inputForm(
                    appbarText,
                    'Mobile number',
                    TextEditingController(
                        text: appbarText.toLowerCase() == 'client'
                            ? _client.phoneNumber
                            : _agent.clientMobileNumber)),
                const SizedBox(
                  height: 20,
                ),
                _inputForm(
                    appbarText,
                    'Email',
                    TextEditingController(
                        text: appbarText.toLowerCase() == 'client'
                            ? _client.emailAddress
                            : _agent.clientEmail)),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'please select one';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: hextocolor('#FAFAFA'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.white)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.white)),
                  ),
                  iconEnabledColor: Theme.of(context).primaryColor,
                  value: appbarText.toLowerCase() == 'client'
                      ? _client.clientCategory
                      : _agent.clientCategory,
                  hint: Text(
                    'Account type',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
                  ),
                  isExpanded: true,
                  items: _dropDownList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16, color: hextocolor('#5E5B5B')),
                      ),
                    );
                  }).toList(),
                  onSaved: (value) {
                    if (appbarText.toLowerCase() == 'client') {
                      _client = Client(
                          clientId: _client.clientId,
                          clientName: _client.clientName,
                          phoneNumber: _client.phoneNumber,
                          emailAddress: _client.emailAddress,
                          clientCategory: value.toString(),
                          clientAddress: _client.clientAddress,
                          clientDistrict: _client.clientDistrict,
                          clientState: _client.clientState);
                    } else {
                      _agent = Agent(
                          clientId: _agent.clientId,
                          clientName: _agent.clientName,
                          clientMobileNumber: _agent.clientMobileNumber,
                          clientEmail: _agent.clientEmail,
                          branchIncharge: _agent.branchIncharge,
                          clientCategory: value.toString(),
                          clientAddress: _agent.clientAddress,
                          clientDistrict: _agent.clientDistrict,
                          clientState: _agent.clientState);
                    }
                  },
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (appbarText.toLowerCase() == 'client') {
                      _client = Client(
                          clientId: _client.clientId,
                          clientName: _client.clientName,
                          phoneNumber: _client.phoneNumber,
                          emailAddress: _client.emailAddress,
                          clientCategory: value.toString(),
                          clientAddress: _client.clientAddress,
                          clientDistrict: _client.clientDistrict,
                          clientState: _client.clientState);
                    } else {
                      _agent = Agent(
                          clientId: _agent.clientId,
                          clientName: _agent.clientName,
                          clientMobileNumber: _agent.clientMobileNumber,
                          clientEmail: _agent.clientEmail,
                          branchIncharge: _agent.branchIncharge,
                          clientCategory: value.toString(),
                          clientAddress: _agent.clientAddress,
                          clientDistrict: _agent.clientDistrict,
                          clientState: _agent.clientState);
                    }
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
                        borderSide: const BorderSide(color: Colors.blue)),
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 5,
                  maxLines: null,
                  controller: TextEditingController(
                      text: appbarText.toLowerCase() == 'client'
                          ? _client.clientAddress
                          : _agent.clientAddress),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field cannot be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (appbarText.toLowerCase() == 'client') {
                      _client = Client(
                          clientId: _client.clientId,
                          clientName: _client.clientName,
                          phoneNumber: _client.phoneNumber,
                          emailAddress: _client.emailAddress,
                          clientCategory: _client.clientCategory,
                          clientAddress: value,
                          clientDistrict: _client.clientDistrict,
                          clientState: _client.clientState);
                    } else {
                      _agent = Agent(
                          clientId: _agent.clientId,
                          clientName: _agent.clientName,
                          clientMobileNumber: _agent.clientMobileNumber,
                          clientEmail: _agent.clientEmail,
                          branchIncharge: _agent.branchIncharge,
                          clientCategory: _agent.clientCategory,
                          clientAddress: value,
                          clientDistrict: _agent.clientDistrict,
                          clientState: _agent.clientState);
                    }
                  },
                  onSaved: (value) {
                    if (appbarText.toLowerCase() == 'client') {
                      _client = Client(
                          clientId: _client.clientId,
                          clientName: _client.clientName,
                          phoneNumber: _client.phoneNumber,
                          emailAddress: _client.emailAddress,
                          clientCategory: _client.clientCategory,
                          clientAddress: value,
                          clientDistrict: _client.clientDistrict,
                          clientState: _client.clientState);
                    } else {
                      _agent = Agent(
                          clientId: _agent.clientId,
                          clientName: _agent.clientName,
                          clientMobileNumber: _agent.clientMobileNumber,
                          clientEmail: _agent.clientEmail,
                          branchIncharge: _agent.branchIncharge,
                          clientCategory: _agent.clientCategory,
                          clientAddress: value,
                          clientDistrict: _agent.clientDistrict,
                          clientState: _agent.clientState);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _inputForm(appbarText, 'Password',
                    TextEditingController(text: _passwordcontroller)),
                const SizedBox(
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
                      const TextSpan(text: '  '),
                      TextSpan(
                          text: 'What is $firstNumber * $secondNumber ?',
                          style: TextStyle(color: hextocolor('#5E5B5B')))
                    ])),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter the security code shown above',
                      hintStyle: Theme.of(context)
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
                          borderSide: const BorderSide(color: Colors.blue)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field cannot be empty';
                      }
                      if (!isNumeric(value)) {
                        return 'Incorrect security code';
                      }
                      if ((firstNumber * secondNumber) != int.parse(value)) {
                        return 'Incorrect security code';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 40,
                ),
                isLoading
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            minimumSize: const Size(double.infinity, 51)),
                        onPressed: () {},
                        child: const Center(
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
                        buttonText: 'Sign Up',
                        borderRadius: 8,
                        ontap: () => signupUser(appbarText),
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
                                  .popAndPushNamed(LoginScreen.routename),
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
