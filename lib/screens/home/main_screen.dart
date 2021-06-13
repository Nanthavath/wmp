import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wmp/screens/home/components/slide_menu.dart';

import 'covers/cover.dart';
import 'nearby/nearby.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> tabs = [
    Cover(),
    NearBy(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: SlideMenu(),
        appBar: AppBar(
          title: Text('WMP'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Cover',
              ),
              Tab(
                text: 'Nearby',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: tabs,
        ),
      ),
    );
  }
}
