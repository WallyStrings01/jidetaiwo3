import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/bottom_navigation_widget.dart';

class PropertiesScreen extends StatelessWidget {
  static const routename = '/propertiesscsreen';
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _datarows = [
      Text(
        '1',
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 14, color: hextocolor('#ACA1A1')),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: 100,
        decoration: BoxDecoration(
            color: hextocolor('#FFEAE8'),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Detached house',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 14, color: Theme.of(context).primaryColor),
        ),
      ),
      Text(
        'Lease',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 14, color: hextocolor('#ACA1A1')),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: hextocolor('#108315').withOpacity(0.13)),
        child: Text('Active',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, color: hextocolor('#1A941F'))),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: hextocolor('#108315').withOpacity(0.13)),
        child: Text('Active',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, color: hextocolor('#1A941F'))),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: hextocolor('#108315').withOpacity(0.13)),
        child: Text('Active',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14, color: hextocolor('#1A941F'))),
      )
    ];
    return Scaffold(
      backgroundColor: hextocolor('#E5E5E5'),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('My Properties', () {}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.white),
              child: FittedBox(
                child: DataTable(
                    dataRowHeight: 80,
                    columnSpacing: 25.0,
                    columns: [
                      DataColumn(
                          label: Text(
                        '#',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Property',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Type',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Tenancy',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Contract',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))
                    ],
                    rows: List.generate(
                      6,
                      (index) => DataRow(
                          cells: List.generate(
                              5, (index) => DataCell(_datarows[index]))),
                    )),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
