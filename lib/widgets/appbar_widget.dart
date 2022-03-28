import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final Function onTap;

  const AppBarWidget(@required this.title, @required this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              )),
          Text(
            title,
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
                fontSize: 20),
          ),
          GestureDetector(
            onTap: () => onTap(),
            child: SvgPicture.asset(
              'assets/icons/Frame2.svg',
              height: 18,
              width: 18,
            ),
          )
        ],
      ),
      actions: [Container()],
    );
  }
}
