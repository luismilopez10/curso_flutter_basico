import 'dart:convert';

import 'package:curso_flutter_basico/services/srvSharedPreferences.dart';
import 'package:curso_flutter_basico/ui/pages/pagContactList.dart';
import 'package:curso_flutter_basico/ui/pages/pagNews.dart';
import 'package:curso_flutter_basico/ui/pages/pagProfile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<Widget> lstPages = [
  pagNews(),
  pagContactList(),
];

GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

class pagHome extends StatefulWidget {
  @override
  _pagHomeState createState() => _pagHomeState();
}

class _pagHomeState extends State<pagHome> {
  String strTitle;
  int intPicker;

  @override
  void initState() {
    super.initState();
    intPicker = 0;
    strTitle = "Noticias";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeKey,
        drawer: Drawer(
          child: Column(
            children: [
              //---------------------------ENCABEZADO---------------------------
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.black, width: 0.01),
                  color: Theme.of(context).primaryColor,
                ),
                height: 130.0,
                child: DrawerHeader(
                  padding: EdgeInsets.only(top: 15.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed("rutProfile");
                      setState(() {
                        strTitle = "Perfil";
                      });
                    },
                    // --------------------------FOTO---------------------------
                    leading: FutureBuilder(
                      future: srvSharedPreferences.readString(key: 'image'),
                      builder: (context, result) {
                        // return Container(
                        //   height: 60.0,
                        //   width: 60.0,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(100.0),
                        //     border: Border.all(color: Colors.black, width: 0.5),
                        //     image: (result.hasData)
                        //         ? DecorationImage(
                        //         image: MemoryImage(base64Decode(result.data)),
                        //         fit: BoxFit.cover)
                        //         : DecorationImage(
                        //         image: NetworkImage("https://static4.abc.es/media/bienestar/2019/08/02/tenis-abecedario-kgNF--1024x512@abc.jpg"),
                        //         fit: BoxFit.cover),
                        //   ),
                        // );
                        return CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          backgroundImage:
                          // (result.hasData)
                          //       ? MemoryImage(base64Decode(result.data))
                          //       // fit: BoxFit.cover)
                          //       : 
                          NetworkImage("https://static4.abc.es/media/bienestar/2019/08/02/tenis-abecedario-kgNF--1024x512@abc.jpg"),
                                // fit: BoxFit.cover),
                          );

                      },
                    ),
                    // -------------------------TÍTULO--------------------------
                    title: FutureBuilder(
                        future: srvSharedPreferences.readString(key: 'nickname'),
                        builder: (context, result) {
                          return Text((result.hasData)
                                  ? "@username"
                                  : "@" + result.data,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.italic));
                        }),
                    // ------------------------SUBTÍTULO------------------------
                    subtitle: Text("Luis Miguel López López",style: TextStyle(color: Colors.white)),
                    // --------------------------ÍCONO--------------------------
                    trailing: Icon(Icons.arrow_right_outlined, color: Colors.white,),
                  ),



                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     FutureBuilder(
                  //       future: srvSharedPreferences.readString(key: 'image'),
                  //       builder: (context, result) {
                  //         return Container(
                  //           height: 60.0,
                  //           width: 60.0,
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(100.0),
                  //             border: Border.all(color: Colors.black, width: 0.5),
                  //             image: (result.hasData)
                  //                 ? DecorationImage(
                  //                 image: MemoryImage(base64Decode(result.data)),
                  //                 fit: BoxFit.cover)
                  //                 : DecorationImage(
                  //                 image: NetworkImage("https://static4.abc.es/media/bienestar/2019/08/02/tenis-abecedario-kgNF--1024x512@abc.jpg"),
                  //                 fit: BoxFit.cover),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //     FutureBuilder(
                  //         future: srvSharedPreferences.readString(key: 'nickname'),
                  //         builder: (context, result) {
                  //           return SizedBox(
                  //             height: double.infinity,
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text((result.hasData)
                  //                         ? "@username"
                  //                         : "@" + result.data,
                  //                     style: TextStyle(
                  //                         color: Colors.grey[600],
                  //                         fontSize: 14.0,
                  //                         fontStyle: FontStyle.italic)),
                  //                 SizedBox(height: 8.0,),
                  //                 Text("Luis Miguel López López",style: TextStyle(fontStyle: FontStyle.italic)),
                  //               ],
                  //             ),
                  //           );
                  //         }),
                  //     Icon(Icons.arrow_right_outlined),
                  //   ],
                  // ),

                ),
              ),
              SizedBox(height: 1.0,),
              //---------------------------NOTICIAS-----------------------------
              ListTile(

                tileColor: Colors.grey[50],
                leading: Icon(MdiIcons.newspaper, color: Theme.of(context).primaryColor,),
                title: Text("Noticias", style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    intPicker = 0;
                    strTitle = "Noticias";
                  });
                },
              ),
              SizedBox(height: 1.0,),
              //---------------------------CONTACTOS----------------------------
              ListTile(
                tileColor: Colors.grey[50],
                leading: Icon(MdiIcons.contacts, color: Theme.of(context).primaryColor,),
                title: Text("Contactos", style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    intPicker = 1;
                    strTitle = "Contactos";
                  });
                },
              ),
              SizedBox(height: 1.0,),
              //-----------------------------PERFIL-----------------------------
              // ListTile(
              //   leading: Icon(MdiIcons.accountBox,),
              //   title: Text("Perfil"),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.of(context).pushNamed("rutProfile");
              //     setState(() {
              //       strTitle = "Perfil";
              //     });
              //   },
              // ),
              //-----------------------------TORNEOS----------------------------
              ListTile(
                tileColor: Colors.grey[50],
                leading: Icon(MdiIcons.tournament, color: Theme.of(context).primaryColor,),
                title: Text("Torneos", style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    intPicker = 1;
                    strTitle = "Torneos";
                  });
                },
              ),
            ],
          ),
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Soy un SnackBar")));
            print("Add button pressed");
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(MdiIcons.dotsVertical), onPressed: () {}),
          ],
          title: Text(strTitle),
        ),
        body: lstPages[intPicker]);
  }
}
