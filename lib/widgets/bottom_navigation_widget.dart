import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Function onTap;
  final int index;
  BottomNavigationWidget(@required this.onTap, @required this.index, {Key? key})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: hextocolor('#585454'),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.index,
        backgroundColor: hextocolor('#FDEFED'),
        onTap: (index) => widget.onTap(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet,
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
        ]);
  }
}
