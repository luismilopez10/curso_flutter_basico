import 'package:flutter/cupertino.dart';

class ctrTheme{

  static final ctrTheme instancia = ctrTheme._();
  ctrTheme._();

  ValueNotifier<bool> blnThemeDark = ValueNotifier(false);

  void fncChangeTheme(bool blnThemeDark){
    this.blnThemeDark.value = blnThemeDark;
  }
}