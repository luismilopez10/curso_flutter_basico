import 'dart:convert';

import 'package:curso_flutter_basico/models/mdlNews.dart';
import 'package:curso_flutter_basico/services/srvFiles.dart';
import 'package:curso_flutter_basico/services/srvHttpRequest.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class pagNews extends StatefulWidget {
  @override
  _pagNewsState createState() => _pagNewsState();
}

class _pagNewsState extends State<pagNews> {

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  Future<String> News;
  List<mdlNews> lstNews = [];

  @override
  void initState() {
    super.initState();
    News = fncReadNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: News,
        builder: (context, response) {
          if (response.hasData) {
            // List<dynamic> NewsJson = jsonDecode(response.data)['results']; // Para NYTimes
            List<dynamic> NewsJson = jsonDecode(response.data)['arts'];
            NewsJson.forEach((element) {
              lstNews.add(mdlNews.fromJson(element));
            });
            return ListView.builder(
                itemCount: lstNews.length,
                itemBuilder: (context, puntero){
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    margin: EdgeInsets.only(top: 1.0),
                    // padding: EdgeInsets.all(5.0),
                    child: ListTile(
                            // onTap: (){
                            //   launch(lstNews[puntero].strUrl);
                            // },
                            // leading: CircleAvatar(child: Text((puntero+1).toString()), backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.black),
                            leading: Container(
                              child: Image(
                                image: NetworkImage(lstNews[puntero].strThumbUrl),
                              ),
                            ),
                            title: Text(lstNews[puntero].strTitle),
                            subtitle: Text(lstNews[puntero].strDescription),
                          )
                  );
                });
          } else if (response.hasError) {
            return Text("${response.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}


// class pagNews extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: fncReadNews(),
//         builder: (context, response) {
//           if (response.hasData) {
//             return Container();
//           } else if (response.hasError) {
//             return Text("${response.error}");
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         });
//
//   }
// }
