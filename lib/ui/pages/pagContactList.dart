import 'package:curso_flutter_basico/controllers/ctrContactList.dart';
import 'package:curso_flutter_basico/models/mdlUser.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_basico/ui/widgets/wdgButtons.dart';
import 'package:curso_flutter_basico/ui/widgets/wdgListTile.dart';

class pagContactList extends StatelessWidget {
  ctrContactList objCtrContactList = ctrContactList.instancia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: objCtrContactList.lstContacts,
        builder: (context, value, child) {
          return Container(
            child: Column(
              children: [
                btnAddContact(),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, intPicker) {
                      return Dismissible(
                          background: Container(
                            color: Colors.grey[200],
                          ),
                          onDismissed: (direction) => value.removeAt(intPicker),
                          key: Key(intPicker.toString()),
                          child:
                              clsCustomListTile(objMdlUser: value[intPicker]));
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
