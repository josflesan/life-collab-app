import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class OurPrimaryButton extends StatefulWidget {
  OurPrimaryButton({Key key, this.click, this.text, this.color});

  final String text;
  final Color color;
  final VoidCallback click;

  @override
  _OurPrimaryButtonState createState() => _OurPrimaryButtonState();
}

class _OurPrimaryButtonState extends State<OurPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: widget.click,
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          textStyle: AppStyles.ELEVATED_BUTTON_TEXT_STYLE,
          padding: AppDimens.BUTTON_PADDING,
          shape: StadiumBorder(),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
