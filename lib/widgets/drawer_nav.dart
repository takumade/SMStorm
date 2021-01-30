import 'package:flutter/material.dart';

class ScreenDrawerNav extends StatelessWidget {
  const ScreenDrawerNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Whatsapp Bulk Sender'),
            onTap: () {
               Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('SMS Bulk Sender'),
            onTap: () {
               Navigator.pushNamed(context, '/sms');
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
               Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}

