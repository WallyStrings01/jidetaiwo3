import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/screens/advisory_screen.dart';
import 'package:jidetaiwoapp/screens/facility_management_screen.dart';
import 'package:jidetaiwoapp/screens/project_management_screen.dart';
import 'package:jidetaiwoapp/screens/public_sector_screen.dart';

class MenuMenuOneDrawer extends StatelessWidget {
  const MenuMenuOneDrawer({Key? key}) : super(key: key);

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
                Navigator.pop(context);
                Navigator.of(context)
                    .pushNamed(FacilityManagementScreen.routename);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'FACILITY MANAGEMENT',
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
                Navigator.pop(context);
                Navigator.of(context)
                    .pushNamed(ProjectManagementScreen.routename);
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
                  'PROJECT DEVELOPMENT',
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
                Navigator.pop(context);
                Navigator.of(context).pushNamed(PublicSectorScreen.routename);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'PUBLIC SECTOR',
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
                Navigator.pop(context);
                Navigator.of(context).pushNamed(AdvisoryScreen.routename);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Text(
                  'ADVISORY & CONSULTANCY',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
