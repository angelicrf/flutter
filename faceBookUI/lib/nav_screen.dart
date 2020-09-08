import 'package:faceBookUI/first_faceBook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    FirstFaceBook(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100.0),
                  child: CustomAppBar(
                      currentUser: currentUser,
                      icons: _icons,
                      onTap: (index) =>
                          setState(() => {_selectedIndex = index})))
              : null,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: _screens,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => {_selectedIndex = index}))
              : SizedBox.shrink(),
        ));
  }
}
