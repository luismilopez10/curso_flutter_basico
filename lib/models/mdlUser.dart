import 'package:flutter/material.dart';

class mdlUser{
  final IconData icnPictureIcon;
  final IconData icnRightIcon;
  String strName;
  String strNickname;
  String strTelephone;
  String strDescription;

  mdlUser({
    this.icnPictureIcon,
    this.icnRightIcon,
    this.strName,
    this.strNickname,
    this.strTelephone,
    this.strDescription});
}


mdlUser objMdlUser1 = mdlUser(
  icnPictureIcon: Icons.person,
  icnRightIcon: Icons.message,
  strName: "Juan David",
  strNickname: "jhonflopez",
  strTelephone: "3136926880",
  strDescription: "4ta Categoría",
);
mdlUser objMdlUser2 = mdlUser(
  icnPictureIcon: Icons.person,
  icnRightIcon: Icons.message,
  strName: "Sara Clavijo",
  strNickname: "saris100",
  strTelephone: "3195314460",
  strDescription: "4ta Categoría",
);
mdlUser objMdlUser3 = mdlUser(
  icnPictureIcon: Icons.person,
  icnRightIcon: Icons.message,
  strName: "Luz Elena",
  strNickname: "luz1066",
  strTelephone: "3116457250",
  strDescription: "4ta Categoría",
);