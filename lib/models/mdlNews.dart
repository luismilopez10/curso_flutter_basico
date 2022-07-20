class mdlNews{
  String strTitle;
  String strDescription;
  String strContent;
  String strThumbUrl;
  String strImageUrl;

  mdlNews({this.strTitle, this.strDescription, this.strThumbUrl, this.strImageUrl, this.strContent});

  // https://esflutter.dev/docs/cookbook/networking/fetch-data
  factory mdlNews.fromJson(Map<String,dynamic> json){
    return mdlNews(
      strTitle: json['tit'],
      strDescription: json['des'],
      strThumbUrl: json['thb'],
      strImageUrl: json['img'],
      strContent: json['con']
    );
  }

}