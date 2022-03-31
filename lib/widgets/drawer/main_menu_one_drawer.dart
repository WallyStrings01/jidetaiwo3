import 'package:flutter/material.dart';

class MenuMenuOneDrawer extends StatelessWidget {
  const MenuMenuOneDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white,
                )
              ),
              child: Text('FACILITY MANAGEMENT',
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                color: Colors.white
              ),),
            ),
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: Text(
                'PROJECT DEVELOPMENT',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: Text(
                'PUBLIC SECTOR',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: Text(
                'ADVISORY & CONSULTANCY',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
