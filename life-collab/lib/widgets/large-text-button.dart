import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class LargeTextButton extends StatefulWidget {
  LargeTextButton({Key key, this.click, this.text, this.color});

  final String text;
  final VoidCallback click;
  final Color color;

  @override
  LargeTextButtonState createState() => LargeTextButtonState();
}

class LargeTextButtonState extends State<LargeTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: widget.click,
        style: TextButton.styleFrom(
          primary: widget.color,
          textStyle: AppStyles.LARGE_TEXT_BUTTON_STYLE,
          padding: AppDimens.BUTTON_PADDING,
          shape: StadiumBorder(),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
