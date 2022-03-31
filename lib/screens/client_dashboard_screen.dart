import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/bottom_navigation_widget.dart';
import 'package:jidetaiwoapp/widgets/client_dashboard_datatable_widget.dart';

class ClientDashboardScreen extends StatelessWidget {
  static const routename = '/clientdashboardscreen';
  const ClientDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hextocolor('#E5E5E5'),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('My Dashboard', () {}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 50, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      'Rent savings',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Flexible(
                          child: Text('100,032.24',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ClientDashboardDataTable()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
