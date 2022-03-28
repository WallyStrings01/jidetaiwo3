import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class SearchforpropertyScreen extends StatelessWidget {
  static const routename = '/searchforpropertyscreen';
  const SearchforpropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Search for Properties', () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TextField(
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
            SizedBox(height: 10,),
            Text('Search by filters',style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
              color: hextocolor('#C4C4C4'),
            ),),
            SizedBox(height: 15,),
            Row(
              children: [
                Expanded(child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: hextocolor('#FAFAFA'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  hint: Text('Type', style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: hextocolor('#C4C4C4')
                  ),),
                  isExpanded: true,
                  items: ['Commercial & Industrial',
                   'Land', 
                   'Mixed use', 
                   'Residential'].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: hextocolor('#5E5B5B')),
                    ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                )),
                SizedBox(width: 20,),
                Expanded(child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: hextocolor('#FAFAFA'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  hint: Text(
                    'Sales',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14, color: hextocolor('#C4C4C4')),
                  ),
                  items: ['Contract', 
                  'Letting', 'Lease', 'Valuation','Sale'].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: hextocolor('#5E5B5B')),
                    ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ))
              ],
            ),
            SizedBox(height: 10,),
             Row(
              children: [
                Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: hextocolor('#FAFAFA'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  hint: Text('Bedrooms', style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: hextocolor('#C4C4C4')
                  ),),
                  isExpanded: true,
                  items: ['1', '2', '3', '4', '5'].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: hextocolor('#5E5B5B')),
                    ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: hextocolor('#FAFAFA'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  hint: Text(
                    'Bathrooms',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14, color: hextocolor('#C4C4C4')),
                  ),
                  items: ['1', '2', '3', '4', '5'].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: hextocolor('#5E5B5B')),
                    ),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ))
              ],
            ),
            SizedBox(height: 10,),
            DropdownButtonFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: hextocolor('#FAFAFA'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              hint: Text(
                'Location',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: hextocolor('#C4C4C4')),
              ),
              isExpanded: true,
              items: ['Nigeria', 'UK (London)', 'UAE (Dubai)'].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value, style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                    color: hextocolor('#5E5B5B')
                  ),),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            SizedBox(height: 10,),
            DropdownButtonFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: hextocolor('#FAFAFA'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              hint: Text(
                'Price Range',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: hextocolor('#C4C4C4')),
              ),
              isExpanded: true,
              items: ['A', 'B', 'C', 'D'].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            SizedBox(height: 10,),
             TextField(
              decoration: InputDecoration(
                labelText: 'Property ID',
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, color: hextocolor('#C4C4C4')),
                filled: true,
                fillColor: hextocolor('#FAFAFA'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButtonWidget(
              width: double.infinity,
              height: 48,
              buttonText: 'Search', 
              borderRadius: 8, 
              ontap: (){}, 
              textColor: Colors.white, 
              bgColor: Theme.of(context).primaryColor)
          ]
        ),
      ),
    );
  }
}
