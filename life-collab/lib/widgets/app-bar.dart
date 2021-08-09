import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';

class OurAppBar extends StatefulWidget implements PreferredSizeWidget {
  OurAppBar({Key key, this.title, this.icon}) : super(key: key);

  final IconData icon;
  final String title;

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  _OurAppBarState createState() => _OurAppBarState();
}

class _OurAppBarState extends State<OurAppBar> {
  void _openChat() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
          alignment: Alignment.centerRight,
          child: FaIcon(widget.icon, color: AppColors.APP_BLACK)),
      backgroundColor: AppColors.APP_WHITE,
      title: Text(widget.title,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            color: AppColors.APP_BLACK,
          )),
      actions: [
        IconButton(
            onPressed: _openChat,
            icon: FaIcon(FontAwesomeIcons.comment, color: AppColors.APP_BLACK))
      ],
    );
  }
}
