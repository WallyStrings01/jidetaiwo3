import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/agentlisting_screen.dart';
import 'package:jidetaiwoapp/screens/auction_screen.dart';
import 'package:jidetaiwoapp/screens/clientlogin_screen.dart';
import 'package:jidetaiwoapp/screens/exploreproperty_screen.dart';
import 'package:jidetaiwoapp/screens/searchforproperty_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/mainmenu_one.dart';

class HomeScreen extends StatelessWidget {
  static const routename = '/homescreen';
  HomeScreen({Key? key}) : super(key: key);

  List gridviewItems = [
    {
      'image': 'assets/icons/propertysearch.png',
      'text': 'Property Search',
      'navigation': ExplorePropertyScreen.routename
    },
    {
      'image': 'assets/icons/clientlogin.png',
      'text': 'Client Login',
      'navigation': ClientLoginScreen.routename
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
    {'image': 'assets/icons/contactus.png', 'text': 'Contact Us'},
    {'image': 'assets/icons/valuation.png', 'text': 'Valuation'}
  ];

  @override
  Widget build(BuildContext context) {
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
      endDrawer: MenuMenuOne(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30),
            itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                    if (gridviewItems[index]['text'] != 'Contact Us' &&
                        gridviewItems[index]['text'] != 'Valuation') {
                      Navigator.of(context)
                          .pushNamed(gridviewItems[index]['navigation']);
                    } else {
                      null;
                    }
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
                                ? EdgeInsets.only(top: 10, left: 10)
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
