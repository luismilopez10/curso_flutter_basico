import 'package:curso_flutter_basico/models/mdlUser.dart';
import 'package:curso_flutter_basico/ui/pages/pagContactDetails.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class clsCustomListTile extends StatelessWidget{

  final mdlUser objMdlUser;

  clsCustomListTile({this.objMdlUser});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pushNamed(context, 'pagContactDetails', arguments: pagContactDetailsArguments(objMdlUser: objMdlUser, strContent: "Content"));
      },
      leading: CircleAvatar(
        //child: Icon(Icons.sports_baseball),
        child: Text(
          objMdlUser.strName[0].toUpperCase(),
        ),
      ),
      trailing: SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(MdiIcons.whatsapp), onPressed: (){
              launch("https://wa.me/+57${objMdlUser.strTelephone}?text=");
            },),
            IconButton(icon: Icon(MdiIcons.phone), onPressed: (){
              launch("tel:${objMdlUser.strTelephone}");
            },),
          ],
        ),
      ),
      title: Row(
        children: [
          Text(objMdlUser.strName),
          Text(" @" + objMdlUser.strNickname, style: TextStyle(color: Colors.grey[500], fontSize: 12.0, fontStyle: FontStyle.italic),)
        ],
      ),
      subtitle: Text(objMdlUser.strDescription),
    );
  }
}