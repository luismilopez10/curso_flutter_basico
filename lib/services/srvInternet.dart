import 'dart:io';

Future<bool> checkInternetConnection() async{
  var result = await InternetAddress.lookup("google.com");
  if (result.isEmpty && result[0].rawAddress.isEmpty){
    return false;
  }
  return true;
}