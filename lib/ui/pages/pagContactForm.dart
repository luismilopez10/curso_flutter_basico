import 'package:curso_flutter_basico/controllers/ctrContactList.dart';
import 'package:curso_flutter_basico/models/mdlUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<FormState> formContactKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class pagContactForm extends StatefulWidget {
  @override
  _pagContactFormState createState() => _pagContactFormState();
}

class _pagContactFormState extends State<pagContactForm> {
  TextEditingController _nameController;
  TextEditingController _nicknameController;
  TextEditingController _telephoneController;
  TextEditingController _descriptionController;

  ctrContactList objCtrContactList = ctrContactList.instancia;
  mdlUser objMdlUser = mdlUser();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _nicknameController = TextEditingController(text: "");
    _telephoneController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
  }

  bool validateAll(){
    if(formContactKey.currentState.validate()){
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Nuevo contacto"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formContactKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //----------------------------NOMBRE----------------------------
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[A-Z a-z]"))
                  ],
                  validator: (value) => validate(value, "nombre"),
                  decoration: InputDecoration(
                    hintText: 'Ej. Luis Miguel López',
                    labelText: 'Nombre',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) => objMdlUser.strName = value,
                  controller: _nameController,
                ),
                SizedBox(height: 12.0),
                //---------------------------NICKNAME---------------------------
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: TextFormField(
                    maxLength: 15,
                    validator: (value) => validate(value, "nickname"),
                    decoration: InputDecoration(
                      hintText: 'Nickname',
                      labelText: 'Nickname',
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    onChanged: (value) => objMdlUser.strNickname = value,
                    controller: _nicknameController,
                  ),
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
                    prefixIcon: Icon(Icons.call),
                  ),
                  onChanged: (value) => objMdlUser.strTelephone = value,
                  controller: _telephoneController,
                ),
                SizedBox(height: 12.0),
                //------------------------DESCRIPCIÓN---------------------------
                TextFormField(
                  validator: (value) => validate(value, "descripción"),
                  decoration: InputDecoration(
                    hintText: 'Ej. Categoría 4',
                    labelText: 'Descripción',
                    prefixIcon: Icon(Icons.description),
                  ),
                  onChanged: (value) => objMdlUser.strDescription = value,
                  controller: _descriptionController,
                ),
                SizedBox(
                  height: 32.0,
                ),
                //-----------------------BOTÓN "Cancelar"-----------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                          ),
                          Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.black,
                          ),
                          Text(
                            ' Cancelar',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    //---------------------BOTÓN "Guardar"----------------------
                    ElevatedButton(
                      onPressed: () {
                        if(validateAll()){
                          objCtrContactList.lstContacts.value =
                          List.from(objCtrContactList.lstContacts.value)..add(objMdlUser);
                          Navigator.pop(context);
                        }
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
