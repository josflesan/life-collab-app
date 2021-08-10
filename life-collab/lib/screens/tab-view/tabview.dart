import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:life_collab/screens/finance/finance.dart';
import 'package:life_collab/screens/home/home.dart';
import 'package:life_collab/screens/plan/plan.dart';
import 'package:life_collab/screens/profile/profile.dart';

class OurTabView extends StatefulWidget {
  const OurTabView({Key key}) : super(key: key);

  @override
  _OurTabViewState createState() => _OurTabViewState();
}

class _OurTabViewState extends State<OurTabView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OurHomeTab(),
    PlanTab(),
    FinanceTab(),
    ProfileTab(),
  ];

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.SECONDARY_ORANGE,
        inactiveColorPrimary: AppColors.FADED_OUT_COLOUR,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.clipboard),
        title: ("Plan"),
        activeColorPrimary: AppColors.SECONDARY_ORANGE,
        inactiveColorPrimary: AppColors.FADED_OUT_COLOUR,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.moneyBill),
        title: ("Finance"),
        activeColorPrimary: AppColors.SECONDARY_ORANGE,
        inactiveColorPrimary: AppColors.FADED_OUT_COLOUR,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.user),
        title: ("Profile"),
        activeColorPrimary: AppColors.SECONDARY_ORANGE,
        inactiveColorPrimary: AppColors.FADED_OUT_COLOUR,
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _children,
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.APP_WHITE,
      decoration: NavBarDecoration(
        colorBehindNavBar: AppColors.APP_WHITE,
        boxShadow: [
          BoxShadow(
            color: AppColors.FADED_OUT_COLOUR.withOpacity(0.5),
            blurRadius: 7.0,
            spreadRadius: 5.0,
          )
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style11,
    );
  }
}
