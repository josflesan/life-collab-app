import 'package:flutter/material.dart';

class OurLoadingScreen extends StatelessWidget {
  const OurLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
