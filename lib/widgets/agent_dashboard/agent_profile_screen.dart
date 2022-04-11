import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/provider/agent_provider.dart';
import 'package:jidetaiwoapp/provider/client_provider.dart';
import 'package:jidetaiwoapp/widgets/appbartwo_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/client_dashboard_menu_drawer.dart';
import 'package:provider/provider.dart';

class AgentProfileScreen extends StatelessWidget {
  const AgentProfileScreen({Key? key}) : super(key: key);

  DataRow dataRows(property, textString) {
    return DataRow(cells: [
      DataCell(Text(
        property,
        style: const TextStyle(fontSize: 15),
      )),
      DataCell(Text(
        textString,
        style: const TextStyle(fontSize: 15),
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final _agent = Provider.of<Agentprovider>(context).getAgent;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'My Profile',
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
                fontSize: 20),
          ),
        ),
        drawerEnableOpenDragGesture: false,
        drawer: const ClientDashboradMenuDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              title: Text(_agent.clientName.toString()),
              subtitle: Text('Email: ${_agent.clientEmail}'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Personal Details',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              child: DataTable(
                  dataRowHeight: 60,
                  showBottomBorder: true,
                  headingRowHeight: 0,
                  columns: const [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text(''))
                  ],
                  rows: [
                    dataRows('Account Type', _agent.clientCategory),
                    dataRows('Mobile Number', _agent.clientMobileNumber),
                    dataRows('Branch In Charge', _agent.branchIncharge),
                    dataRows('Address', _agent.clientAddress),
                    dataRows('District', _agent.clientDistrict),
                    dataRows('State', _agent.clientState),
                  ]),
            )
          ],
        ));
  }
}
