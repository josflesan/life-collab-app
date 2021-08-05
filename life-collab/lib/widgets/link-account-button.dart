import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class LinkAccountButton extends StatefulWidget {
  const LinkAccountButton({Key key, this.click, this.text, this.icon})
      : super(key: key);

  final VoidCallback click;
  final String text;
  final Image icon;

  @override
  _LinkAccountButtonState createState() => _LinkAccountButtonState();
}

class _LinkAccountButtonState extends State<LinkAccountButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: widget.click,
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: AppColors.FADED_OUT_COLOUR,
            side: BorderSide(color: AppColors.FADED_OUT_COLOUR, width: 0.3),
            padding: AppDimens.BUTTON_PADDING,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            widget.icon,
            SizedBox(width: AppDimens.SMALL_SPACER),
            Text(widget.text, style: AppStyles.SUBTITLE_STYLE),
          ]),
        ));
  }
}
