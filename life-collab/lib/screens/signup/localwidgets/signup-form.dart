import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/screens/login/login.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:life_collab/widgets/primary-button.dart';
import 'package:life_collab/widgets/text-form.dart';
import 'package:provider/provider.dart';

class OurSignUpForm extends StatefulWidget {
  const OurSignUpForm({Key key}) : super(key: key);

  @override
  _OurSignUpFormState createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, String fullName,
      BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullName, context);
      if (_returnString == "success") {
        Navigator.pop(context); // Pop signup screen
        // Return to Login Screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OurLogin()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(_returnString), duration: Duration(seconds: 2)));
      }
    } catch (e) {
      print(e);
    }
  }

  void validateAccount() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Passwords do not match"),
          duration: Duration(seconds: 2)));
    } else if (_passwordController.text.length <= 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password should be at least 7 characters long"),
          duration: Duration(seconds: 2)));
    } else {
      _signUpUser(_emailController.text, _passwordController.text,
          _fullNameController.text, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppDimens.SMALL_SPACER),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OurTextForm(
              controller: _fullNameController,
              labelText: "Name",
              hintText: "John Doe",
              icon: Icons.person),
          SizedBox(height: AppDimens.SMALL_SPACER),
          OurTextForm(
              controller: _emailController,
              labelText: "Email",
              hintText: "myemail@gmail.com",
              icon: Icons.mail_outline),
          SizedBox(height: AppDimens.SMALL_SPACER),
          OurTextForm(
              controller: _passwordController,
              labelText: "Password",
              hintText: ""),
          SizedBox(height: AppDimens.SMALL_SPACER),
          OurTextForm(
              controller: _confirmPasswordController,
              labelText: "Confirm Password",
              hintText: ""),
          SizedBox(height: AppDimens.SMALL_SPACER),
          OurPrimaryButton(
              click: validateAccount,
              text: "Sign Up",
              color: AppColors.PRIMARY_GREEN),
        ],
      ),
    );
  }
}
