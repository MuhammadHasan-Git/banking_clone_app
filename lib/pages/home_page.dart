import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_clone_app/theme/color.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        activeIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        });
  }
}
