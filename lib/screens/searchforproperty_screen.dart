import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class SearchforpropertyScreen extends StatelessWidget {
  static const routename = '/searchforpropertyscreen';
  const SearchforpropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _dropdownform(String hintText, List<String> data) {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: hextocolor('#FAFAFA'),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        hint: Text(hintText, style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 14,
          color: hextocolor('#C4C4C4')
        ),),
        isExpanded: true,
        items: data.map((value) {
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
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('Search for Properties', () {}),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/watermarkimage2.png'))
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Search by filters',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: hextocolor('#C4C4C4'),
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: _dropdownform('Type', ['Commercial & Industrial','Land','Mixed use','Residential'])),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: _dropdownform('Sales', ['Contract', 'Letting', 'Lease', 'Valuation', 'Sale']))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: _dropdownform('Bedrooms', ['1', '2', '3', '4', '5'])),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: _dropdownform('Bathrooms', ['1', '2', '3', '4', '5']))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _dropdownform('Location', ['Nigeria', 'UK (London)', 'UAE (Dubai)']),
            const SizedBox(
              height: 10,
            ),
            _dropdownform('Price Range', ['A', 'B', 'C', 'D']),
            const SizedBox(
              height: 10,
            ),
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
                    borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButtonWidget(
                width: double.infinity,
                height: 48,
                buttonText: 'Search',
                borderRadius: 8,
                ontap: () {},
                textColor: Colors.white,
                bgColor: Theme.of(context).primaryColor)
          ]),
        ),
      ),
    );
  }
}
