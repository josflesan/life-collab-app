import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/widgets/app-bar.dart';

class PlanTab extends StatelessWidget {
  const PlanTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OurAppBar(title: "Your Plans", icon: FontAwesomeIcons.clipboard),
      body: Container(color: Colors.orange),
    );
  }
}
