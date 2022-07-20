import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:curso_flutter_basico/services/srvSharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:curso_flutter_basico/services/srvFiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<FormState> formUserKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class pagProfile extends StatefulWidget {
  @override
  _pagProfileState createState() => _pagProfileState();
}

class _pagProfileState extends State<pagProfile> {
  TextEditingController _nameController;
  TextEditingController _nicknameController;
  TextEditingController _telephoneController;
  TextEditingController _descriptionController;

  String strPath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _nicknameController = TextEditingController(text: "");
    _telephoneController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
    strPath = "";
  }

  bool validateAll(){
    if(formUserKey.currentState.validate()){
      return true;
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserte todos los datos necesarios")));
      //formPageKey.currentState.showSnackBar(SnackBar(content: Text("Inserte todos los datos necesarios")));
      return false;
    }
  }

  String validate(String value, String key) =>
      value.isEmpty ? "Ingrese su $key" : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formPageKey,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Perfil", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formUserKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                //-----------------------------FOTO-----------------------------
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    FutureBuilder(
                        future: srvSharedPreferences.readString(key: 'image'),
                        builder: (context, result) {
                          return Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                    color: Colors.black, width: 0.5),
                                image:
                                    // strPath != ""
                                    // ? DecorationImage(
                                    // image: FileImage(File(strPath)),
                                    // fit: BoxFit.cover)
                                    // : result.hasData
                                    // ? DecorationImage(
                                    // image: MemoryImage(base64Decode(result.data)),
                                    // fit: BoxFit.cover)
                                    // :
                                DecorationImage(
                                  // image: ImageIcon("https://static4.abc.es/media/bienestar/2019/08/02/tenis-abecedario-kgNF--1024x512@abc.jpg"),
                                    image: AssetImage("assets/tenis-default-profile-picture.jpg"),
                                    fit: BoxFit.cover)
                            ),
                          );
                        }),
                    //--------------------------CÁMARA--------------------------
                    Container(
                      margin: EdgeInsets.only(left: 180.0),
                      child: IconButton(
                        icon: Icon(MdiIcons.cameraPlus),
                        iconSize: 35,
                        onPressed: () async {
                          String strImage = await srvFiles.getImage(blnCamera: true);
                          setState(() {
                            strPath = strImage;
                          });
                        },
                      ),
                    ),
                    //-------------------------GALERÍA--------------------------
                    Container(
                      margin: EdgeInsets.only(right: 180.0),
                      child: IconButton(
                        icon: Icon(MdiIcons.imagePlus),
                        iconSize: 35,
                        onPressed: () async {
                          String strImage = await srvFiles.getImage();
                          setState(() {
                            strPath = strImage;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0,),
                //----------------------------NOMBRE----------------------------
                TextFormField(
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[A-Z a-z]"))
                  ],
                  validator: (value) => validate(value, "nombre"),
                  decoration: InputDecoration(
                    hintText: 'Ej. Luis Miguel López',
                    labelText: 'Nombre',
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) => (){},
                  controller: _nameController,
                ),
                SizedBox(height: 12.0),
                //---------------------------NICKNAME---------------------------
                TextFormField(
                  maxLength: 15,
                  validator: (value) => validate(value, "nickname"),
                  decoration: InputDecoration(
                    hintText: 'Nickname',
                    labelText: 'Nickname',
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                    prefixIcon: Icon(Icons.alternate_email_rounded),
                  ),
                  onChanged: (value) => (){},
                  controller: _nicknameController,
                ),
                SizedBox(height: 12.0),
                //---------------------------TELÉFONO---------------------------
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  validator: (value) => validate(value, "teléfono"),
                  decoration: InputDecoration(
                    hintText: 'Ej. (+57) 314 123 4567',
                    labelText: 'Teléfono (+57)',
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                    prefixIcon: Icon(Icons.call),
                  ),
                  onChanged: (value) => (){},
                  controller: _telephoneController,
                ),
                SizedBox(height: 12.0),
                //--------------------------DESCRIPCIÓN-------------------------
                TextFormField(
                  validator: (value) => validate(value, "descripción"),
                  decoration: InputDecoration(
                    helperMaxLines: 10,
                    hintText: 'Ej. Categoría 4',
                    labelText: 'Descripción',
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                    prefixIcon: Icon(Icons.description),
                  ),
                  onChanged: (value) => (){},
                  controller: _descriptionController,
                ),
                SizedBox(
                  height: 32.0,
                ),
                //---------------------BOTÓN "Guardar"----------------------
                ElevatedButton(
                  onPressed: () {

                    File file = File(strPath);
                    String imgConvert = base64Encode(file.readAsBytesSync());

                    srvSharedPreferences.writeString(key: 'name', value: _nameController.text);
                    srvSharedPreferences.writeString(key: 'nickname', value: _nicknameController.text);
                    srvSharedPreferences.writeString(key: 'telephone', value: _telephoneController.text);
                    srvSharedPreferences.writeString(key: 'description', value: _descriptionController.text);
                    srvSharedPreferences.writeString(key: 'image', value: imgConvert);

                    print("Preferencias guardadas");

                    // if(validateAll()){
                    //   //TODO: Cambiar valores del usuario!
                    // }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                      ),
                      Icon(
                        Icons.save,
                        size: 35,
                        color: Colors.black,
                      ),
                      Text(
                        ' Guardar',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _telephoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
