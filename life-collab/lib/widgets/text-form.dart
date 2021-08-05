import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class OurTextForm extends StatefulWidget {
  const OurTextForm({Key key, this.hintText, this.labelText, this.icon})
      : super(key: key);

  final String hintText;
  final String labelText;
  final IconData icon;

  @override
  _OurTextFormState createState() => _OurTextFormState();
}

class _OurTextFormState extends State<OurTextForm> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.labelText == "Password" ? _obscureText : false,
      style: (_obscureText && widget.labelText == "Password")
          ? AppStyles.PASSWORD_HIDDEN
          : AppStyles.FORM_INPUT_STYLE,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: widget.labelText == "Password"
            ? IconButton(
                onPressed: _toggle,
                icon: _obscureText
                    ? Icon(Icons.visibility_off,
                        color: AppColors.FADED_OUT_COLOUR)
                    : Icon(
                        Icons.visibility,
                        color: AppColors.FADED_OUT_COLOUR,
                      ),
              )
            : Icon(widget.icon, color: AppColors.FADED_OUT_COLOUR),
        labelText: widget.labelText,
        labelStyle: AppStyles.FORM_LABEL_STYLE,
        hintText: widget.hintText,
      ),
    );
  }
}
