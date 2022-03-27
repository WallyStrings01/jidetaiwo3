import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';

class SearchforpropertyScreen extends StatelessWidget {
  const SearchforpropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Search for Properties'),
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
              color: hextocolor('#C4C4C4')
            ),)
          ],
        ),
      ),
    );
  }
}
