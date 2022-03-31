import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/login_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';

class DashboardScreen extends StatelessWidget {
  static const routename = '/dashboardscreen';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Dashboard', () {}),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/watermarkimage2.png'))),
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(LoginScreen.routename, arguments: 'client');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color: hextocolor('#FDEFED'),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Client Dashboard',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context)
                    .pushNamed(LoginScreen.routename, arguments: 'agent');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color: hextocolor('#FDEFED'),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Agent Dashboard',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
