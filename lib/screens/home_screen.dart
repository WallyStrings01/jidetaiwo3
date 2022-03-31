import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/agentlisting_screen.dart';
import 'package:jidetaiwoapp/screens/auction_screen.dart';
import 'package:jidetaiwoapp/screens/dashboardscreen.dart';
import 'package:jidetaiwoapp/screens/getintouch_screen.dart';
import 'package:jidetaiwoapp/screens/login_screen.dart';
import 'package:jidetaiwoapp/screens/exploreproperty_screen.dart';
import 'package:jidetaiwoapp/screens/valuation_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/main_menu_one_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routename = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List gridviewItems = [
      {
        'image': 'assets/icons/propertysearch.png',
        'text': 'Property Search',
        'navigation': ExplorePropertyScreen.routename
      },
      {
        'image': 'assets/icons/clientlogin.png',
        'text': 'Client Login',
        'navigation': DashboardScreen.routename
      },
      {
        'image': 'assets/icons/saleauctions.png',
        'text': 'Auctions',
        'navigation': AuctionScreen.routename
      },
      {
        'image': 'assets/icons/agentlisting.png',
        'text': 'Agent Property Listing',
        'navigation': AgentListingScreen.routename
      },
      {'image': 'assets/icons/contactus.png', 'text': 'Contact Us', 'navigation' : GetInTouchScreen.routename},
      {'image': 'assets/icons/valuation.png', 'text': 'Valuation', 'navigation' : ValuationScreen.routename}
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) => AppBarWidget('JIDE TAIWO & CO.', () {
            Scaffold.of(context).openEndDrawer();
          }),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: const MenuMenuOneDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30),
            itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                      Navigator.of(context)
                          .pushNamed(gridviewItems[index]['navigation']);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding: index != 4
                                ? const EdgeInsets.only(top: 10, left: 10)
                                : null,
                            decoration: index != 4
                                ? BoxDecoration(
                                    color: hextocolor('#FFEAE8'),
                                    shape: BoxShape.circle)
                                : null,
                            child: Image(
                              image: AssetImage(gridviewItems[index]['image']),
                              fit: BoxFit.cover,
                            )),
                        Text(
                          gridviewItems[index]['text'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
