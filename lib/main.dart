import 'package:curso_flutter_basico/controllers/ctrTheme.dart';
import 'package:curso_flutter_basico/ui/pages/pagContactForm.dart';
import 'package:curso_flutter_basico/ui/pages/pagHome.dart';
import 'package:curso_flutter_basico/ui/pages/pagContactDetails.dart';
import 'package:curso_flutter_basico/ui/pages/pagProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  ctrTheme objCtrTheme = ctrTheme.instancia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: objCtrTheme.blnThemeDark,
      builder: (context, value, child) {
        return MaterialApp(
            routes: {
              'pagContactDetails': (context) => pagContactDetails(),
              'rutProfile': (context) => pagProfile(),
              'rutContactForm': (context) => pagContactForm(),
            },
            debugShowCheckedModeBanner: false,
            title: 'TennisApp',
            theme: ThemeData(
              brightness: value ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.lightGreen,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: pagHome());
      },
    );
  }
}
