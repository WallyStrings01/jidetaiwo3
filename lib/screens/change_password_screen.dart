import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/provider/agent_provider.dart';
import 'package:jidetaiwoapp/provider/client_provider.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:provider/provider.dart';

import '../hextocolor.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routename = '/chnagepasswordscreen';
  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordcontroller1 = TextEditingController();
  final TextEditingController _newPasswordController2 = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';
  bool showError = false;
  String? option;
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  Widget _buildTextForm(String name, TextEditingController _controller, bool obscureText) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            name,
            style: TextStyle(fontSize: 14, color: hextocolor('#333333')),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          controller: _controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: hextocolor('#FAFAFA'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      if (name.toLowerCase() == 'old password') {
                        _obscureOldPassword = !_obscureOldPassword;
                      }
                      else if (name.toLowerCase() == 'new password') {
                        _obscureNewPassword = !_obscureNewPassword;
                      }
                      else{
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      }
                    });
                  },
                  icon: Icon(obscureText
                      ? Icons.visibility_off
                      : Icons.visibility))),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 14, color: hextocolor('#333333')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field cannot be empty';
            }
            if (name.toLowerCase() != 'old password') {
              bool hasMinLength = value.length >= 6;
              if (!hasMinLength) {
                return 'password must be greater than 6 characters';
              }
              bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
              bool hasDigits = value.contains(RegExp(r'[0-9]'));
              bool hasLowercase = value.contains(RegExp(r'[a-z]'));
              bool hasSpecialCharacters =
                  value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
              if (!(hasUppercase &&
                  hasDigits &&
                  hasLowercase &&
                  hasSpecialCharacters)) {
                return 'missing uppercase, digits and special characters';
              }
            }
            if ((name.toLowerCase() == 'confirm password' &&
                    _newPasswordcontroller1.text !=
                        _newPasswordController2.text) ||
                name.toLowerCase() == 'new password' &&
                    _newPasswordcontroller1.text !=
                        _newPasswordController2.text) {
              return 'password does not match';
            }
            return null;
          },
          onSaved: (value) {
            if (name.toLowerCase() == 'old password') {
              _oldPasswordController.text = value.toString();
            }
            if (name.toLowerCase() == 'new password') {
              _newPasswordcontroller1.text = value.toString();
            }
          },
        ),
      ],
    );
  }

  Future<void> changepassword() async {
    final isvalid = _formKey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isLoading = true;
    });
    try {
      if (option.toString().toLowerCase() == 'client') {
        await Provider.of<Clientprovider>(context, listen: false)
            .chnagepassword(
                _oldPasswordController.text, _newPasswordcontroller1.text);
      } else {
        await Provider.of<Agentprovider>(context, listen: false).chnagepassword(
            _oldPasswordController.text, _newPasswordcontroller1.text);
      }
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password have been changed successfully'),
        duration: Duration(seconds: 3),
      ));
    } catch (error) {
      if (error.toString().contains('HttpException')) {
        final extractedMessage = error.toString().split('HttpException: ')[1];
        if (extractedMessage.trim() == 'INVALID_PASSWORD') {
          errorMessage = 'Your old password is incorrect';
        }
      } else {
        errorMessage = 'An error occurred, try again later';
      }
      setState(() {
        showError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    option = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28,
            )),
        title: Text(
          'Change Password',
          style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
              fontSize: 20),
        ),
        actions: [Container()],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
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
                      _buildTextForm('Old password', _oldPasswordController, _obscureOldPassword),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm('New password', _newPasswordcontroller1, _obscureNewPassword),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm(
                          'Confirm password', _newPasswordController2, _obscureConfirmPassword),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      isLoading
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: hextocolor('#22C929').withOpacity(0.2),
                                minimumSize: Size(double.infinity, 51),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
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
                              buttonText: 'Update',
                              borderRadius: 8,
                              textSize: 20,
                              ontap: changepassword,
                              textColor: hextocolor('#1C8320'),
                              bgColor: hextocolor('#22C929').withOpacity(0.2)),
                    ])),
              ),
            ],
          )),
      //bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
