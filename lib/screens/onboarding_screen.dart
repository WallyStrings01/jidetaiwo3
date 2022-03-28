import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/button_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/mainmenu_one.dart';
import 'package:jidetaiwoapp/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  static const routename = '/onboardingscreen';
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Builder(
            builder: (context) => AppBarWidget('JIDE TAIWO & CO.', () {
              Scaffold.of(context).openEndDrawer();
            }),
          ),
        ),
        endDrawerEnableOpenDragGesture: false,
        endDrawer: MenuMenuOne(),
        body: PageView.builder(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (ctx, index) => OnboardingWidget(
                  pageController: _pageController,
                  screenIndex: index,
                  imgText: 'assets/images/onb${index + 1}img.png',
                )));
  }
}
