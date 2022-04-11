import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/httpexception.dart';
import 'package:jidetaiwoapp/provider/agent_provider.dart';
import 'package:jidetaiwoapp/provider/client_dashboard_provider.dart';
import 'package:jidetaiwoapp/provider/client_provider.dart';
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
  final _focusNode = {'client id': FocusNode(), 'phone number': FocusNode()};
  String id = '';
  String phoneNum = '';
  bool showError = false;
  String? errormessage;

  Future<void> loginUser() async {
    final isvalid = _formkey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _formkey.currentState!.save();
    setState(() {
      isloading = true;
    });
    try {
      if(appbarText == 'client'){
        final clientId =
            await Provider.of<Clientprovider>(context, listen: false)
                .loginUser(id, phoneNum);
        await Provider.of<ClientDashboardProvider>(context, listen: false)
            .fetchClientDashboardInformation(int.parse(clientId));
        Navigator.of(context).pushNamed(ClientDashboardScreen.routename);
      }
      else{
        final agentId =
            await Provider.of<Agentprovider>(context, listen: false)
                .loginUser(id, phoneNum);
        Navigator.of(context).pushNamed(AgentdashboardScreen.routename, arguments: agentId);
      }
    } catch (error) {
      if (error.toString().contains('HttpException')) {
        errormessage = error.toString().split('HttpException: ')[1];
      } else {
        errormessage = 'An error occurred, try again later';
      }
      setState(() {
        showError = true;
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    appbarText = ModalRoute.of(context)!.settings.arguments as String;
    Widget _inputForm(String label) {
      return TextFormField(
        keyboardType: label.trim().toLowerCase() == 'phone number'
            ? TextInputType.number
            : TextInputType.text,
        textInputAction: label.trim().toLowerCase() == 'phone number'
            ? TextInputAction.done
            : TextInputAction.next,
        focusNode: _focusNode[label],
        onSaved: (value) {
          if (label.trim().toLowerCase() == 'phone number') {
            phoneNum = value.toString();
          }
          if (label.trim().toLowerCase() == 'client id' || label.trim().toLowerCase() == 'agent id') {
            id = value.toString();
          }
        },
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
          if (label.trim().toLowerCase() == 'phone number' &&
              value.length != 11) {
            return 'Invalid phone number';
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
                if (showError == true)
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      errormessage.toString(),
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                _inputForm(appbarText == 'client' ? 'Client id' : 'Agent id'),
                const SizedBox(
                  height: 20,
                ),
                _inputForm('Phone number'),
                const SizedBox(
                  height: 60,
                ),
                isloading
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            minimumSize: Size(double.infinity, 51)),
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
