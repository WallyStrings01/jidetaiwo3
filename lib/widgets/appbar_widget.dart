import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget(@required this.title ,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          )),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
            fontSize: 20),
      ),
      actions: const [
        Image(
          image: AssetImage('assets/icons/menuicon.png'),
          height: 50,
          width: 50,
        )
      ],
    );
  }
}
