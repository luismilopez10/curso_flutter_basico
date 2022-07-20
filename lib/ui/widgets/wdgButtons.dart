import 'package:curso_flutter_basico/controllers/ctrMain.dart';
import 'package:curso_flutter_basico/controllers/ctrTheme.dart';
import 'package:flutter/material.dart';

class btnAddContact extends StatelessWidget {
  ValueNotifier<String> strTitulo = ValueNotifier<String>("Add Contact");
  ctrTheme objCtrTheme = ctrTheme.instancia;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //strTitulo.value = "Value Notifier Button";
          //objCtrTheme.fncChangeTheme(true);
          fncBtnAddContactPressed();
          Navigator.pushNamed(context, 'rutContactForm');
        },
        child: ValueListenableBuilder(
          valueListenable: strTitulo,
          builder: (context, value, child) {
            return Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(value,
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0)),
              ),
            );
          },
        ));
  }
}
