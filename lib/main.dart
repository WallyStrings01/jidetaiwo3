import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/provider/client_dashboard_provider.dart';
import 'package:jidetaiwoapp/provider/property_provider.dart';
import 'package:jidetaiwoapp/screens/aboutus_screen.dart';
import 'package:jidetaiwoapp/screens/advisory_screen.dart';
import 'package:jidetaiwoapp/screens/agency_screen.dart';
import 'package:jidetaiwoapp/screens/agentlisting_screen.dart';
import 'package:jidetaiwoapp/screens/auction_screen.dart';
import 'package:jidetaiwoapp/screens/change_password_screen.dart';
import 'package:jidetaiwoapp/screens/client_dashboard_screen.dart';
import 'package:jidetaiwoapp/screens/login_screen.dart';
import 'package:jidetaiwoapp/screens/signup_screen.dart';
import 'package:jidetaiwoapp/screens/complaint_screen.dart';
import 'package:jidetaiwoapp/screens/dashboardscreen.dart';
import 'package:jidetaiwoapp/screens/exploreproperty_screen.dart';
import 'package:jidetaiwoapp/screens/facility_management_screen.dart';
import 'package:jidetaiwoapp/screens/getintouch_screen.dart';
import 'package:jidetaiwoapp/screens/home_screen.dart';
import 'package:jidetaiwoapp/screens/agent_dashboard_screen.dart';
import 'package:jidetaiwoapp/screens/onboarding_screen.dart';
import 'package:jidetaiwoapp/screens/profile_screen.dart';
import 'package:jidetaiwoapp/screens/project_management_screen.dart';
import 'package:jidetaiwoapp/screens/properties_screen.dart';
import 'package:jidetaiwoapp/screens/public_sector_screen.dart';
import 'package:jidetaiwoapp/screens/searchforproperty_screen.dart';
import 'package:jidetaiwoapp/screens/splash_screen.dart';
import 'package:jidetaiwoapp/screens/valuation_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClientDashboardProvider()),
        ChangeNotifierProvider(create: (_) => PropertyProvider())
      ],
      child: MaterialApp(
        title: 'Jide Taiwo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: hextocolor('#D30016'),
          colorScheme:
              ThemeData().colorScheme.copyWith(secondary: hextocolor('#FFEEED')),
          brightness: Brightness.light,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36.0,
                  fontStyle: FontStyle.normal),
              bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
              button: TextStyle(
                  fontFamily: 'Roboto', fontSize: 18, color: Colors.white)),
        ),
        home: const SplashScreen(),
        routes: {
          AboutusScreen.routename: (ctx) => AboutusScreen(),
          AgencyScreen.routename: (ctx) => AgencyScreen(),
          AgentListingScreen.routename: (ctx) => AgentListingScreen(),
          AuctionScreen.routename: (ctx) => AuctionScreen(),
          LoginScreen.routename: (ctx) => LoginScreen(),
          SignupScreen.routename: (ctx) => SignupScreen(),
          DashboardScreen.routename: (ctx) => DashboardScreen(),
          ExplorePropertyScreen.routename: (ctx) => ExplorePropertyScreen(),
          HomeScreen.routename: (ctx) => HomeScreen(),
          AgentdashboardScreen.routename: (ctx) => AgentdashboardScreen(),
          OnboardingScreen.routename: (ctx) => OnboardingScreen(),
          SearchforpropertyScreen.routename: (ctx) => SearchforpropertyScreen(),
          GetInTouchScreen.routename : (ctx) => GetInTouchScreen(),
          ValuationScreen.routename: (ctx) => ValuationScreen(),
          FacilityManagementScreen.routename : (ctx) => FacilityManagementScreen(),
          ProjectManagementScreen.routename : (ctx) => ProjectManagementScreen(),
          PublicSectorScreen.routename : (ctx) => PublicSectorScreen(),
          AdvisoryScreen.routename : (ctx) => AdvisoryScreen(),
          PropertiesScreen.routename : (ctx) => PropertiesScreen(),
          ProfileScreen.routename : (ctx) => ProfileScreen(),
          ComplaintsScreen.routename : (ctx) => ProfileScreen(),
          ChangePasswordScreen.routename : (ctx) => ChangePasswordScreen(),
          ClientDashboardScreen.routename : (ctx) => ClientDashboardScreen()
        },
      ),
    );
  }
}
