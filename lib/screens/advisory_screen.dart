import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/widgets/bottom_navigation_widget.dart';
import 'package:jidetaiwoapp/provider/advisory_consultancy_provider.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class AdvisoryScreen extends StatelessWidget {
  static const routename = '/advisoryscreen';
  const AdvisoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget('Advisory & Consultancy', () {}),
          preferredSize: const Size.fromHeight(kToolbarHeight)),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: advisories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Image.asset(
                        '${advisories[index].image}',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        advisories[index].title!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        advisories[index].text!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14, height: 1.5),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButtonWidget(
                            width: 211,
                            height: 38,
                            buttonText: 'Speak To Us',
                            borderRadius: 10,
                            textSize: 14,
                            ontap: () {},
                            textColor: Colors.white,
                            bgColor: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                );
              })),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}