import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/mainmenu_two.dart';

class MydashboardScreen extends StatefulWidget {
  static const routename = '/mydashboardscreen';
  const MydashboardScreen({Key? key}) : super(key: key);

  @override
  State<MydashboardScreen> createState() => _MydashboardScreenState();
}

class _MydashboardScreenState extends State<MydashboardScreen> {
  int navigationBarCurrentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hextocolor('#E5E5E5'),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) => AppBarWidget('My Dashboard', () {
            Scaffold.of(context).openEndDrawer();
          }),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: MenuMenuTwo(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text('12', style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Total number of your property listings',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, color: hextocolor('#5E5B5B')),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ElevatedButtonWidget(
                              width: double.maxFinite,
                              height: 50,
                              buttonText: 'Add new properties',
                              borderRadius: 8,
                              textSize: 14,
                              ontap: () {},
                              textColor: Colors.white,
                              bgColor: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButtonWidget(
                              width: double.maxFinite,
                              height: 50,
                              buttonText: 'View details',
                              borderRadius: 8,
                              textSize: 14,
                              ontap: () {},
                              textColor: Colors.white,
                              bgColor: Theme.of(context).primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                     CircleAvatar(
                      radius: 36,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text(
                          '12',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Total number of prospect',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, color: hextocolor('#5E5B5B')),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonWidget(
                        width: double.maxFinite,
                        height: 50,
                        buttonText: 'View details',
                        borderRadius: 8,
                        textSize: 14,
                        ontap: () {},
                        textColor: Colors.white,
                        bgColor: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                     CircleAvatar(
                      radius: 36,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text(
                          '12',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Total number of properties available',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, color: hextocolor('#5E5B5B')),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonWidget(
                        width: double.maxFinite,
                        height: 50,
                        buttonText: 'View details',
                        borderRadius: 8,
                        textSize: 14,
                        ontap: () {},
                        textColor: Colors.white,
                        bgColor: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                     CircleAvatar(
                      radius: 36,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text(
                          '12',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Total number of views',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, color: hextocolor('#5E5B5B')),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonWidget(
                        width: double.maxFinite,
                        height: 50,
                        buttonText: 'Add new properties',
                        borderRadius: 8,
                        textSize: 14,
                        ontap: () {},
                        textColor: Colors.white,
                        bgColor: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: hextocolor('#585454'),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationBarCurrentIndex,
          backgroundColor: hextocolor('#FDEFED'),
          onTap: (index) {
            setState(() {
              navigationBarCurrentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet,
                ),
                label: 'Wallet'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'),
          ]),
    );
  }
}
