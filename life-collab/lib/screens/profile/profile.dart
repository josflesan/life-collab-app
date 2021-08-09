import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/widgets/app-bar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OurAppBar(title: "Your Profile", icon: FontAwesomeIcons.user),
      body: Container(
        color: Colors.lightBlue,
      ),
    );
  }
}
