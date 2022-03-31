import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';
import 'package:jidetaiwoapp/widgets/drawer/client_dashboard_menu_drawer.dart';
import 'package:jidetaiwoapp/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  static const routename = '/onboardingscreen';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Builder(
            builder: (context) => AppBarWidget('JIDE TAIWO & CO.', () {
              Scaffold.of(context).openEndDrawer();
            }),
          ),
        ),
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const ClientDashboradMenuDrawer(),
        body: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (ctx, index) => OnboardingWidget(
                  pageController: _pageController,
                  screenIndex: index,
                  imgText: 'assets/images/onb${index + 1}img.png',
                )));
  }
}
