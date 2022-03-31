import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/model/property_model.dart';
import 'package:jidetaiwoapp/provider/property_provider.dart';
import 'package:jidetaiwoapp/screens/searchforproperty_screen.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class ExplorePropertyScreen extends StatefulWidget {
  static const routename = '/explorescreen';
  const ExplorePropertyScreen({Key? key}) : super(key: key);

  @override
  State<ExplorePropertyScreen> createState() => _ExplorePropertyScreenState();
}

class _ExplorePropertyScreenState extends State<ExplorePropertyScreen> {
  final FocusNode _searchfocusNode = FocusNode();
  final value = NumberFormat("#,##0.00", "en_US");

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
    if (_searchfocusNode.hasFocus) {
      FocusScope.of(context).unfocus();
      Navigator.of(context).pushNamed(SearchforpropertyScreen.routename);
    }
  }

  Widget _fourContainers(IconData icon, String label, Color bgColor, Color textColor) {
    return Container(
      height: 46,
      width: (MediaQuery.of(context).size.width / 2) - 35.0,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: textColor,
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  color: textColor
                ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _propertiesData =
        Provider.of<PropertyProvider>(context).getPropertiesData;

    List<Property> _propertiesList = [];
    _propertiesData.forEach((property) {
      _propertiesList.add(Property(
          imageUrl: property.imageUrl,
          description: property.description,
          officeId: property.officeId,
          location: property.location,
          branch: property.branch,
          price: property.price,
          contract: property.contract,
          numberOfRooms: property.numberOfRooms,
          status: property.status,
          area: property.area,
          numberOfBathrooms: property.numberOfBathrooms,
          numberOfViews: property.numberOfViews,
          balcony: property.balcony,
          parking: property.parking));
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Explore our properties', () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _propertiesList.length,
                    itemBuilder: (ctx, index) => Column(
                          children: [
                            Image.asset(
                              _propertiesList[index].imageUrl!,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(_propertiesList[index].description!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16)),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
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
                                        'Office ID: ${_propertiesList[index].officeId}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Location: ${_propertiesList[index].location![0].toUpperCase()}${_propertiesList[index].location!.substring(1)}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Branch: ${_propertiesList[index].branch![0].toUpperCase()}${_propertiesList[index].branch!.substring(1)}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Price: ${value.format(_propertiesList[index].price!.toInt())}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Contract: ${_propertiesList[index].contract![0].toUpperCase()}${_propertiesList[index].contract!.substring(1)}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Rooms: ${_propertiesList[index].numberOfRooms}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Status: ${_propertiesList[index].status![0].toUpperCase()}${_propertiesList[index].status!.substring(1)}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      Text(
                                        'Area: ${_propertiesList[index].area!.toInt()} Sq. mtr',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bathrooms: ${_propertiesList[index].numberOfBathrooms}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 14,
                                            color: hextocolor('#5694C1')),
                                      ),
                                      if (_propertiesList[index].balcony ==
                                          true)
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              size: 18,
                                              color: hextocolor('#5694C1'),
                                            ),
                                            const SizedBox(
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
                                  const SizedBox(
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
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${_propertiesList[index].numberOfViews} views',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                color: hextocolor('#5694C1')),
                                          )
                                        ],
                                      ),
                                      if (_propertiesList[index].parking ==
                                          true)
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              size: 18,
                                              color: hextocolor('#5694C1'),
                                            ),
                                            const SizedBox(
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
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _fourContainers(Icons.share, 'Share property', hextocolor('#E1E1E1'), Colors.black),
                                _fourContainers(Icons.favorite_outline, 'Add to Favourites', hextocolor('#FDEFED'), hextocolor('#EC5757'))
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _fourContainers(Icons.call, 'Give us a call', hextocolor('#F2FFF3'), hextocolor('#247828')),
                                _fourContainers(Icons.mail, 'Send a message', hextocolor('#FFFAEC'), hextocolor('#CF9B14'))
                              ],
                            ),
                            const SizedBox(
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
