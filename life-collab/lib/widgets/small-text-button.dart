import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class SmallTextButton extends StatefulWidget {
  SmallTextButton({Key key, this.click, this.text, this.color});

  final String text;
  final VoidCallback click;
  final Color color;

  @override
  SmallTextButtonState createState() => SmallTextButtonState();
}

class SmallTextButtonState extends State<SmallTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.click,
      style: TextButton.styleFrom(
        primary: widget.color,
        textStyle: AppStyles.SMALL_TEXT_BUTTON_STYLE,
      ),
      child: Text(widget.text),
    );
  }
}
