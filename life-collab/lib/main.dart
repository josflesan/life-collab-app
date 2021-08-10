import 'package:flutter/material.dart';
import 'package:life_collab/resources/menus/values/app_colors.dart';
import 'package:life_collab/screens/root/root.dart';
import 'package:life_collab/states/currentUser.dart';
import 'package:life_collab/utils/lightTheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.APP_WHITE,
      statusBarBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentUser>(
      create: (_) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme().buildTheme(context),
        home: OurRoot(),
      ),
    );
  }
}
