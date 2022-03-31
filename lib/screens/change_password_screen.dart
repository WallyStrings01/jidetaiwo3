import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/bottom_navigation_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

import '../hextocolor.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routename = '/chnagepasswordscreen';
  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 =
      TextEditingController(text: 'Oluwajuwon Smith');
  final TextEditingController _controller2 =
      TextEditingController(text: 'www@gmail.com');
  final TextEditingController _controller3 =
      TextEditingController(text: '09022725654');

  Widget _buildTextForm(String name, TextEditingController _controller) {
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
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: hextocolor('#FAFAFA'),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      size: 20,
                    ))),
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, color: hextocolor('#333333'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget('My Profile', () {}),
          preferredSize: const Size.fromHeight(kToolbarHeight)),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      _buildTextForm('Old password', _controller1),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm('New password', _controller2),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm('Confirm password', _controller3),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButtonWidget(
                          width: double.infinity,
                          height: 55,
                          buttonText: 'Update',
                          borderRadius: 8,
                          textSize: 20,
                          ontap: () {},
                          textColor: hextocolor('#1C8320'),
                          bgColor: hextocolor('#22C929').withOpacity(0.2)),
                    ])),
              ),
            ],
          )),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
