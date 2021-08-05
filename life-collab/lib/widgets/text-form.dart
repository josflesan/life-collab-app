import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_styles.dart';

class OurTextForm extends StatefulWidget {
  const OurTextForm({Key key, this.hintText, this.labelText}) : super(key: key);

  final String hintText;
  final String labelText;

  @override
  _OurTextFormState createState() => _OurTextFormState();
}

class _OurTextFormState extends State<OurTextForm> {
  bool _obscureText = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          _obscureText ? AppStyles.PASSWORD_HIDDEN : AppStyles.FORM_INPUT_STYLE,
      obscureText: _obscureText,
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
            : Icon(Icons.email_outlined, color: AppColors.FADED_OUT_COLOUR),
        labelText: widget.labelText,
        labelStyle: AppStyles.FORM_LABEL_STYLE,
        hintText: widget.hintText,
      ),
    );
  }
}
