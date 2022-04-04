import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/appbartwo_widget.dart';
import 'package:jidetaiwoapp/widgets/bottom_navigation_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/client_dashboard_menu_drawer.dart';

import '../hextocolor.dart';

class EditProfileScreen extends StatefulWidget {
  static const routename = '/profilescreen';
  const EditProfileScreen({Key? key}) : super(key: key);
  
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 =
      TextEditingController(text: 'Oluwajuwon Smith');
  final TextEditingController _controller2 =
      TextEditingController(text: 'www@gmail.com');
  final TextEditingController _controller3 =
      TextEditingController(text: '09022725654');
  final TextEditingController _controller4 =
      TextEditingController(text: 'VI Lagos State');

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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            ),
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
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) => AppBarWidget('Edit Profile'),
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: const ClientDashboradMenuDrawer(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      _buildTextForm('Name', _controller1),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm('Phone', _controller2),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm('Email', _controller3),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTextForm('Address', _controller4),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Last Login: 06/03/2022 6:32 pm',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 14, color: hextocolor('#A19898')),
                        ),
                      ),
                    ])),
              ),
              ElevatedButtonWidget(
                  width: double.infinity,
                  height: 55,
                  buttonText: 'Edit Profile',
                  borderRadius: 8,
                  textSize: 20,
                  ontap: () {},
                  textColor: Colors.white,
                  bgColor: Theme.of(context).primaryColor),
            ],
          )),
      //bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
