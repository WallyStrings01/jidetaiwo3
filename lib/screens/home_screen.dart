import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List gridviewItems = [
    {'image': 'assets/images/propertysearch.png', 'text': 'Property Search'},
    {'image': 'assets/images/clientlogin.png', 'text': 'Client Login'},
    {'image': 'assets/images/saleauctions.png', 'text': 'Auctions'},
    {
      'image': 'assets/images/agentlisting.png',
      'text': 'Agent Property Listing'
    },
    {'image': 'assets/images/contactus.png', 'text': 'Contact Us'},
    {'image': 'assets/images/valuation.png', 'text': 'Valuation'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('JIDE TAIWO & CO.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30),
            itemBuilder: (ctx, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: index != 4 ? EdgeInsets.only(top: 10, left: 10) : null,
                          decoration: index != 4 ? BoxDecoration(
                              color: hextocolor('#FFEAE8'),
                              shape: BoxShape.circle) : null,
                          child: Image(
                            image:
                                AssetImage(gridviewItems[index]['image']),
                            fit: BoxFit.cover,
                          )),
                      Text(gridviewItems[index]['text'], style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor
                      ),
                      textAlign: TextAlign.center,)
                    ],
                  ),
                )),
      ),
    );
  }
}
