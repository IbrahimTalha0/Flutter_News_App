import 'package:flutter/material.dart';

import 'package:news/pages/categoryNews.dart';


class MyDrawer extends StatefulWidget {
  final String rssUrl;

  const MyDrawer({Key key, this.rssUrl}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

 Drawer _newsCategory(){
    if(widget.rssUrl.contains("t24")){
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
                icon: Icons.home_filled,
                text: "Genel",
                rssUrl: "https://t24.com.tr/rss"),
            newsCategory(
                icon: Icons.public,
                text: "Dünya",
                rssUrl: "https://t24.com.tr/rss/haber/dunya"),
            newsCategory(
                icon: Icons.coronavirus,
                text: "Koronavirüs",
                rssUrl: "https://t24.com.tr/rss/haber/koronavirus"),
            newsCategory(
                icon: Icons.account_balance,
                text: "Siyaset",
                rssUrl: "https://t24.com.tr/rss/haber/politika"),
            newsCategory(
                icon: Icons.money,
                text: "Ekonomi",
                rssUrl: "https://t24.com.tr/rss/haber/ekonomi"),
            newsCategory(
                icon: Icons.sports_basketball,
                text: "Spor",
                rssUrl: "https://t24.com.tr/rss/haber/spor"),
            newsCategory(
                icon: Icons.people_alt,
                text: "Magazin",
                rssUrl: "https://t24.com.tr/rss/haber/magazin"),
            newsCategory(
                icon: Icons.science,
                text: "Bilim/Teknoloji",
                rssUrl: "https://t24.com.tr/rss/haber/bilim-teknoloji"),
            newsCategory(
                icon: Icons.local_hospital,
                text: "Sağlık",
                rssUrl: "https://t24.com.tr/rss/haber/saglik"),
            newsCategory(
                icon: Icons.school,
                text: "Eğitim",
                rssUrl: "https://t24.com.tr/rss/haber/egitim"),
          ],
        ),
      ),
    );
    }else if(widget.rssUrl.contains("haberturk")){
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
                icon: Icons.home_filled,
                text: "Genel",
                rssUrl: "https://www.haberturk.com/rss"),
            newsCategory(
                icon: Icons.public,
                text: "Dünya",
                rssUrl: "https://www.haberturk.com/rss/kategori/dunya.xml"),
            newsCategory(
                icon: Icons.money,
                text: "Ekonomi",
                rssUrl: "https://www.haberturk.com/rss/ekonomi.xml"),
            newsCategory(
                icon: Icons.sports_basketball,
                text: "Spor",
                rssUrl: "https://www.haberturk.com/rss/spor.xml"),
            newsCategory(
                icon: Icons.people_alt,
                text: "Magazin",
                rssUrl: "https://www.haberturk.com/rss/magazin.xml"),
            newsCategory(
                icon: Icons.local_hospital,
                text: "Sağlık",
                rssUrl: "https://www.haberturk.com/rss/kategori/saglik.xml"),
          ],
        ),
      ),
    );
    }else{  
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
                icon: Icons.home_filled,
                text: "Genel",
                rssUrl: "https://www.sabah.com.tr/rss/gundem.xml",
                ),
            
            newsCategory(
                icon: Icons.public,
                text: "Dünya",
                rssUrl: "https://www.sabah.com.tr/rss/dunya.xml"),
            newsCategory(
                icon: Icons.money,
                text: "Ekonomi",
                rssUrl: "https://www.sabah.com.tr/rss/ekonomi.xml"),
            newsCategory(
                icon: Icons.sports_basketball,
                text: "Spor",
                rssUrl: "https://www.sabah.com.tr/rss/spor.xml"),
            newsCategory(
                icon: Icons.local_hospital,
                text: "Sağlık",
                rssUrl: "https://www.sabah.com.tr/rss/saglik.xml"),
          ],
        ),
      ),
    );
    }

  }
  @override
  Widget build(BuildContext context) {
    return _newsCategory();
  }

  ListTile newsCategory({icon, text,String rssUrl}) {
    String newsSite;
    if(rssUrl.contains("t24")){
      newsSite = "T24";
    }else if(rssUrl.contains("sabah")){
      newsSite = "Sabah";
    }else{
      newsSite = "Haber Türk";
    }
    return ListTile(
        leading:  Icon(icon,),
        title: Text(text),
        
        onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsPage(
                    newsSite: newsSite,
                        rssUrl: rssUrl,
                        newsType: text,
                      )),
              ModalRoute.withName('/'),
            ));
  }
}
