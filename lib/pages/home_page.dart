import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_clone_app/pages/dashboard_page.dart';
import 'package:banking_clone_app/theme/color.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = 4;
          });
        },
        child: FaIcon(
          FontAwesomeIcons.creditCard,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getTabs() {
    List<IconData> iconsItems = [
      CommunityMaterialIcons.view_grid,
      CommunityMaterialIcons.comment,
      CommunityMaterialIcons.bell,
      CommunityMaterialIcons.account_circle,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconsItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        activeIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        });
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DashboardPage(),
        Center(
            child: Text(
          "Chat Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        Center(
            child: Text(
          "Notification Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        Center(
            child: Text(
          "Account Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        Center(
            child: Text(
          "Credit Card Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
