import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:news/pages/categoryNews.dart';


class MyDrawer extends StatefulWidget {
  final String rssUrl;

  const MyDrawer({Key key, this.rssUrl}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

 Drawer _newsCategory(){
    return Drawer(
      child: Container(

        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black38, BlendMode.multiply),
                        image: AssetImage("assets/images/news1.jpg"),
                        fit: BoxFit.cover)),
                child: Align(
                    child: Text(
                  "Haber Çeşitleri",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white),
                ))),
            newsCategory(
                icon: "assets/images/sabah.svg",
                text: "Sabah",
                rssUrl: "https://www.sabah.com.tr/rss/anasayfa.xml"),
             newsCategory(
                icon: "assets/images/haberTurk.svg",
                text: "Haber Türk",
                rssUrl: "https://www.haberturk.com/rss"),
              newsCategory(
                icon: "assets/images/t24.svg",
                text: "T24",
                rssUrl: "https://t24.com.tr/rss"),
  
          ],
        ),
      ),
    );
    }

  
  @override
  Widget build(BuildContext context) {
    return _newsCategory();
  }

  ListTile newsCategory({String icon, text,String rssUrl}) {
    String newsSite;
    var leading;
    if(rssUrl.contains("t24")){
      newsSite = "T24";
      leading = SvgPicture.asset(icon, fit: BoxFit.cover, height: 33, width: 33,);
    }else if(rssUrl.contains("sabah")){
      newsSite = "Sabah";
      leading = SvgPicture.asset(icon, fit: BoxFit.cover, height: 60, width: 60,);
    }else{
      newsSite = "Haber Türk";
      leading = SvgPicture.asset(icon, fit: BoxFit.cover, height: 27, width: 27,);
    }
    return ListTile(
        leading: leading,
        title: Text(text),
        
        onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsPage(
                    newsSite: newsSite,
                        rssUrl: rssUrl,
                        newsType: "Genel",
                        isListTile: true,
                      )),
              ModalRoute.withName('/'),
            ));
  }
}
