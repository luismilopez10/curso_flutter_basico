import 'dart:convert';
import 'package:curso_flutter_basico/models/mdlNews.dart';
import 'package:curso_flutter_basico/services/srvInternet.dart';
import 'package:http/http.dart' as http;


Future<String> fncReadNews() async{
  var response;

  if (await checkInternetConnection()){
    // response = await http.get(Uri.parse("https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=Ad3V8Zfq3xkhCXkLSAm6yyN0InYuqX9s"),
    //     headers: {'Content-Type': 'application/json'});
    response = await http.get(Uri.parse("https://livescore6.p.rapidapi.com/news/list?category=tennis"),
        headers: {'x-rapidapi-key': 'a22b7b0ba3msh9b41497900dc111p142aa2jsnbfde2f3d43a2',
        'x-rapidapi-host': 'livescore6.p.rapidapi.com'});
  }

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return response.body;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Error de carga, verifica la conectividad a internet.');
  }
}