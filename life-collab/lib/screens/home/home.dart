import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/screens/root/root.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:life_collab/widgets/app-bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class OurHomeTab extends StatelessWidget {
  const OurHomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OurAppBar(title: "Your Household", icon: FontAwesomeIcons.home),
      backgroundColor: Colors.purple,
      body: Center(),
    );
  }
}
