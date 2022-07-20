import 'package:curso_flutter_basico/models/mdlUser.dart';
import 'package:flutter/material.dart';

class pagContactDetails extends StatelessWidget {

  pagContactDetails();

  @override
  Widget build(BuildContext context) {

    final pagContactDetailsArguments arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.objMdlUser.strName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(arguments.strContent),
      ),
    );
  }
}

class pagContactDetailsArguments{

  final mdlUser objMdlUser;
  final String strContent;

  pagContactDetailsArguments({this.objMdlUser, this.strContent});

}