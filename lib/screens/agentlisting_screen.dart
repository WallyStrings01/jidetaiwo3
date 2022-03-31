import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';

class AgentListingScreen extends StatelessWidget {
  static const routename = '/agenctlistingscreen';

  const AgentListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('JIDE TAIWO & CO.', () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: hextocolor('#F6CFCD')),
                    child: const Image(
                        image:
                            AssetImage('assets/images/agentlistingmain.png')))),
            Expanded(
                child: Column(
              children: [
                const Spacer(),
                Text(
                  'List your property to thousands of potential clients, find quality buyers, sellers and renters.',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 20,
                      ),
                ),
                const Spacer(),
                 Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButtonWidget(
                          width: double.infinity,
                          height: 48,
                          bgColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          borderRadius: 10,
                          buttonText: 'Create a Free Account',
                          ontap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButtonWidget(
                          width: double.infinity,
                          height: 48,
                          borderRadius: 10,
                          bgColor: Colors.white,
                          borderColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                          buttonText: 'Sign In',
                          ontap: () {})
                    ],
                  ),
                const Spacer()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
