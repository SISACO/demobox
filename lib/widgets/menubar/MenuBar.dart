

import 'package:Donobox/functions/auth_gate.dart';
import 'package:Donobox/screens/AmountAdd/AmountAdd.dart';
import 'package:Donobox/screens/profile/profile.dart';
import 'package:Donobox/screens/transaction/payment.dart';
import 'package:flutter/material.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color(0XFFFFDC73),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/logo/dono-logo.png'))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ProfileScrn()))
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Topup Wallet'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => AddAmount(
                      showAppBar: true,
                    ))),
          ),
          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {ExitApp(context)},
          ),
        ],
      ),
    );
  }
}