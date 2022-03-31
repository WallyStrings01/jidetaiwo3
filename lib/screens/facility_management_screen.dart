import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/widgets/bottom_navigation_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:jidetaiwoapp/provider/facility_mgt_provider.dart';
import 'package:jidetaiwoapp/widgets/drawer/main_menu_one_drawer.dart';

import '../widgets/appbar_widget.dart';

class FacilityManagementScreen extends StatelessWidget {
  static const routename = '/facilitymanagementscreen';

  const FacilityManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarWidget('Facility Management', () {}),
            preferredSize: const Size.fromHeight(kToolbarHeight),
            ),
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const MenuMenuOneDrawer(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: facilities.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            'Facilities Management encompasses a range of services to ensure the health and safety, efficiency, welfare, comfort and functionality of a building, its residents and employees and the ground it sits on. With over four decades hands on experience in this field, we have proven track record in property/facility management that optimize resources for investors and occupiers across all types of properties.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 14, height: 1.5),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  }
                 else {
                   return Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Column(
                      children: [
                        Image.asset(
                          '${facilities[index - 1].image}',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          facilities[index - 1].title!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          facilities[index - 1].text!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 13, height: 1.5),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButtonWidget(
                              width: 211,
                              height: 38,
                              buttonText: 'Speak To Us',
                              borderRadius: 8,
                              textSize: 14,
                              ontap: () {},
                              textColor: Colors.white,
                              bgColor: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                  ),
                   );
                 }
                })),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
