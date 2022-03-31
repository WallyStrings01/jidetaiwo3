import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/screens/change_password_screen.dart';
import 'package:jidetaiwoapp/screens/complaint_screen.dart';
import 'package:jidetaiwoapp/screens/dashboardscreen.dart';
import 'package:jidetaiwoapp/screens/profile_screen.dart';
import 'package:jidetaiwoapp/screens/properties_screen.dart';

class ClientDashboradMenuDrawer extends StatelessWidget {
  const ClientDashboradMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(DashboardScreen.routename);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'MY DASHBOARD',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PropertiesScreen.routename);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'MY PROPERTIES',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProfileScreen.routename);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'MY PROFILE',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ComplaintsScreen.routename);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'REPORT A COMPLAINT',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ChangePasswordScreen.routename);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'CHANGE PASSWORD',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: Text(
                'SIGN OUT',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
