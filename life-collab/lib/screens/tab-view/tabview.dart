import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Collab'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.SECONDARY_ORANGE,
        selectedLabelStyle: AppStyles.NAVBAR_ITEM_TEXT_SEL,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home,
                color: AppColors.FADED_OUT_COLOUR),
            activeIcon: FaIcon(FontAwesomeIcons.home,
                color: AppColors.SECONDARY_ORANGE),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clipboard,
                  color: AppColors.FADED_OUT_COLOUR),
              activeIcon: FaIcon(FontAwesomeIcons.clipboard,
                  color: AppColors.SECONDARY_ORANGE),
              label: "Plan"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.moneyBill,
                  color: AppColors.FADED_OUT_COLOUR),
              activeIcon: FaIcon(FontAwesomeIcons.moneyBill,
                  color: AppColors.SECONDARY_ORANGE),
              label: "Finance"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user,
                  color: AppColors.FADED_OUT_COLOUR),
              activeIcon: FaIcon(FontAwesomeIcons.user,
                  color: AppColors.SECONDARY_ORANGE),
              label: "Profile"),
        ],
      ),
    );
  }
}
