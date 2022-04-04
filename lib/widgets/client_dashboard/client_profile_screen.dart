import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbartwo_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/client_dashboard_menu_drawer.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) => AppBarTwoWidget('My Profile', () {
            Scaffold.of(context).openDrawer();
          }),
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: const ClientDashboradMenuDrawer(),
      body: Center(
        child: Text('MY PROFILE COMING SOON',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 24, color: hextocolor('#A9A3A3'))),
      ),
    );
  }
}
