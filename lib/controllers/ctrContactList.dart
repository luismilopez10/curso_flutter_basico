import 'package:curso_flutter_basico/models/mdlUser.dart';
import 'package:flutter/cupertino.dart';

class ctrContactList {

  static List<mdlUser> lstUsers = [
    objMdlUser1,
    objMdlUser2,
    objMdlUser3,
    objMdlUser2,
  ];

  static final ctrContactList instancia = ctrContactList._();

  ctrContactList._();

  ValueNotifier<List<mdlUser>> lstContacts = ValueNotifier<List<mdlUser>>(lstUsers);
}
