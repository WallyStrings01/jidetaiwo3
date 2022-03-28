import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';

class AgencyScreen extends StatefulWidget {
  static const routename = '/agencyscreen';
  
  const AgencyScreen({Key? key}) : super(key: key);

  @override
  State<AgencyScreen> createState() => _AgencyScreenState();
}

class _AgencyScreenState extends State<AgencyScreen> {
  int navigationBarCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Agency', () {}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'No matter the dynamics, when it comes to letting, buying or selling of properties of any kind, we are a trusted ally. We are experienced well enough to transact or advice across all residential, commercial, industrial and agricultural markets. Our experts are available and ready to meet your needs. We are always poised to offer you the benefits of our strong market knowledge. Our in-house experts will guide you all the way through transaction conceptualization to completion.',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, height: 1.3),
              ),
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Image(image: AssetImage('assets/images/lettingservices.png')),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 66,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: hextocolor('#000000').withOpacity(0.3)),
                    child: Text(
                      'LETTING SERVICES',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Image(
                      image: AssetImage('assets/images/sellingproperties.png')),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 66,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: hextocolor('#000000').withOpacity(0.3)),
                    child: Text(
                      'SELLING/BUYING PROPERTIES',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Image(
                      image: AssetImage('assets/images/shortletservices.png')),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 66,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: hextocolor('#000000').withOpacity(0.3)),
                    child: Text(
                      'SHORTLET SERVICES',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              )
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
              label: 'Home',
            ),
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
