import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/resources/menus/values/app_dimens.dart';
import 'package:life_collab/screens/home/home.dart';
import 'package:life_collab/screens/no-group/no-group.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:life_collab/widgets/primary-button.dart';
import 'package:life_collab/widgets/text-form.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  const OurLoginForm({Key key}) : super(key: key);

  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _currentUser.loginUserWithEmail(email, password, context);
      if (_returnString == "success") {
        Navigator.popUntil(
            context, ModalRoute.withName('/')); // Pop all previous screens
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OurHomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(_returnString), duration: Duration(seconds: 2)));
      }
    } catch (e) {
      print(e);
    }
  }

  void validateUser() {
    _loginUser(_emailController.text, _passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppDimens.BUTTON_PADDING,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          OurPrimaryButton(
              click: validateUser,
              text: "Login",
              color: AppColors.PRIMARY_GREEN),
        ],
      ),
    );
  }
}
