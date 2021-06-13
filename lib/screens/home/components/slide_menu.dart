import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wmp/utils/constants.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _drawerHeader(),
          _drawerBody(),
          Text('Logout')
        ],
      ),
    );
  }

  _drawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(0.0),
      child: Container(
        width: double.infinity,
        color: backgroundColor,
        child: Center(
          child: UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 100,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            accountName: Text('Henry Cavil'),
            accountEmail: Text(''),
          ),
        ),
      ),
    );
  }

  _drawerBody() {
    return Expanded(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle,color: Colors.black,),
              title: Text('Account'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
