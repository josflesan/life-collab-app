import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class OurTextButton extends StatefulWidget {
  OurTextButton({Key key, this.click, this.text, this.color});

  final String text;
  final VoidCallback click;
  final Color color;

  @override
  _OurTextButtonState createState() => _OurTextButtonState();
}

class _OurTextButtonState extends State<OurTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: widget.click,
        style: TextButton.styleFrom(
          primary: widget.color,
          textStyle: AppStyles.TEXT_BUTTON_STYLE,
          padding: AppDimens.BUTTON_PADDING,
          shape: StadiumBorder(),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
