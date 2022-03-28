import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/screens/searchforproperty_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';

class ExplorePropertyScreen extends StatefulWidget {
  static const routename = '/explorescreen';
  const ExplorePropertyScreen({Key? key}) : super(key: key);

  @override
  State<ExplorePropertyScreen> createState() => _ExplorePropertyScreenState();
}

class _ExplorePropertyScreenState extends State<ExplorePropertyScreen> {
  FocusNode _searchfocusNode = FocusNode();

  @override
  void initState() {
    _searchfocusNode.addListener(_onsearchTap);
    super.initState();
  }

  @override
  void dispose() {
    _searchfocusNode.removeListener(_onsearchTap);
    _searchfocusNode.dispose();
    super.dispose();
  }

  void _onsearchTap() {
    if(_searchfocusNode.hasFocus)
    {
      FocusScope.of(context).unfocus();
      Navigator.of(context).pushNamed(SearchforpropertyScreen.routename);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Explore our properties', () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              autofocus: false,
              focusNode: _searchfocusNode,
              decoration: InputDecoration(
                labelText: 'Search for properties',
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
                filled: true,
                fillColor: hextocolor('#FAFAFA'),
                suffixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (ctx, index) => Column(
                          children: [
                            Container(
                                child: Image.asset(
                              'assets/images/landproperty.png',
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                'A Three (3) bedroom bungalow with mini 3 bedroom bungalow fenced round with gate, built on one full plot of land',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16)),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: hextocolor('#F7FCFF'),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Office ID: SL|ILO|206|37|1',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Location: Ilorin',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Branch: Ilorin branch',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Price: 16,000,000',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Contract: Sale',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Rooms: 3',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Status: Available',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Area: 450 Sq. mtr',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bathrooms: 4',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            size: 18,
                                            color: hextocolor('#5694C1'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Balcony',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                color: hextocolor('#5694C1')),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            size: 18,
                                            color: hextocolor('#5694C1'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '4 views',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                color: hextocolor('#5694C1')),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            size: 18,
                                            color: hextocolor('#5694C1'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'parking',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                color: hextocolor('#5694C1')),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 46,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          35.0,
                                  decoration: BoxDecoration(
                                      color: hextocolor('#E1E1E1'),
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.share,
                                        size: 24,
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        'Share Property',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 46,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          35.0,
                                  decoration: BoxDecoration(
                                      color: hextocolor('#FDEFED'),
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        size: 24,
                                        color: hextocolor('#EC5757'),
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        'Add to Favourites',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 14,
                                                color: hextocolor('#EC5757')),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 46,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          35.0,
                                  decoration: BoxDecoration(
                                      color: hextocolor('#F2FFF3'),
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 24,
                                        color: hextocolor('#247828'),
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        'Give us a call',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 14,
                                                color: hextocolor('#247828')),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 46,
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          35.0,
                                  decoration: BoxDecoration(
                                      color: hextocolor('#FFFAEC'),
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        size: 24,
                                        color: hextocolor('#CF9B14'),
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        'Send a message',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 14,
                                                color: hextocolor('#CF9B14')),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        )))
          ],
        ),
      ),
    );
  }
}
