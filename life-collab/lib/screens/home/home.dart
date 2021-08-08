import 'package:flutter/material.dart';
import 'package:life_collab/screens/root/root.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:provider/provider.dart';

class OurHomeScreen extends StatelessWidget {
  const OurHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Sign Out"),
          onPressed: () async {
            CurrentUser _currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            String _returnString = await _currentUser.signOut();
            if (_returnString == "success") {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OurRoot(),
                  ),
                  (route) => false);
            }
          },
        ),
      ),
    );
  }
}
