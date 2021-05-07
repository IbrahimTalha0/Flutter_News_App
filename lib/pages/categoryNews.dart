import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/AdmobService.dart';
import 'package:news/widgets/ShowNews.dart';
import 'package:news/widgets/drawerMenu.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;
import 'package:cached_network_image/cached_network_image.dart';

import '../models/category_card_model.dart';
import '../widgets/category_card.dart';

class NewsPage extends StatefulWidget {
  final bool isListTile;
  final String rssUrl;
  final String newsType;
  final String newsSite;

  const NewsPage(
      {Key key, this.rssUrl, this.newsType, this.newsSite, this.isListTile})
      : super(key: key);
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final Widget svgTheme = SvgPicture.asset(
    "assets/images/theme.svg",
    semanticsLabel: 'Acme Logo',
    color: Colors.white,
  );
  RssFeed _feed;
  String rssurl;
  String _newsType;
  String _newsSite;
  bool _istListTile;
  List<CategoryCardModel> categories = [];

  AdvertService advertService = AdvertService();

  GlobalKey<RefreshIndicatorState>
      _refreshKey; // yukarıdan çektiğimiz sayfanın yenilenmesi için kullanacağımız key
  static const String placeholderImg =
      'assets/images/news-97862_640.png'; // resimler yüklenene kadar gözükecek resim yolu

  Future<void> load() async {
    await loadFeed().then((result) async {
      if (null == result || result.toString().isEmpty) {
        return;
      }
      setState(() {
        _feed = result;
      });
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(rssurl);
      final responseBody = utf8.decode(response.bodyBytes);
      return RssFeed.parse(responseBody);
    } on Exception {}
    return null;
  }

  @override
  void initState() {
    super.initState();
    rssurl = widget.rssUrl;
    _istListTile = widget.isListTile;
    _newsType = widget.newsType;
    _newsSite = widget.newsSite;
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    load();
    categories = CategoryCardModel.getCategories();

    print(rssurl);
  }

  Widget list() {
    // ekranda göreceğimiz arayüz. Arayüzde değiştirme isterseniz burayı güncellememiz gerekiyor.
    return ListView(
      primary: true,
      children: <Widget>[
        Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.only(left: 5),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Center(
                    child: CategoryCard(
                  imageAssetUrl: categories[index].categoryImage,
                  categoryName: categories[index].categoryName,
                  rssUrl: categories[index].rssUrl,
                ));
              }),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _feed.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _feed.items[index];
              return Container(
                child: _istListTile == true
                    ? listCardPage(item)
                    : newsCardPage(item),
              );
            },
          ),
        ),
      ],
    );
  }

  listCardPage(RssItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4, right: 4),
      child: Material(
        child: Card(
          margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
          shadowColor: Colors.black,
          elevation: 3,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: ListTile(
                  subtitle: Text(
                    item.pubDate.toString().substring(0, 16) ??
                        "Tarih", // haber ilk girildiğinde Tarih bazen boş olabiliyor, hata almamak için bu şeklide bir kullanım tercih ettim
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    item.title ??
                        "Başlık", // haber ilk girildiğinde title bazen boş olabiliyor, hata almamak için bu şeklide bir kullanım tercih ettim
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(
                      placeholderImg,
                      fit: BoxFit.fill,
                    ),
                    imageUrl: item.enclosure.url,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Material newsCardPage(RssItem item) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: GestureDetector(
            //haberin üzerine tıklayınca haber ayrıntılarına gitmek için kullanıyoruz.
            onTap: () {
              advertService.showInsterstitialAd();
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => ShowNews(item: item)));
            },
            child: newsImage(item)),
      ),
    );
  }

  Widget newsTitle(RssItem item) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title ??
                  "Başlık", // haber ilk girildiğinde title bazen boş olabiliyor, hata almamak için bu şeklide bir kullanım tercih ettim
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              item.pubDate.toString().substring(0, 16) ??
                  "Tarih", // haber ilk girildiğinde Tarih bazen boş olabiliyor, hata almamak için bu şeklide bir kullanım tercih ettim
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget newsImage(RssItem item) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
              placeholder: (context, url) => Image.asset(
                    placeholderImg,
                    height: 213,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
              imageUrl: item.enclosure.url,
              alignment: Alignment.center,
              height: 213,
              width: double.infinity,
              fit: BoxFit.fill),
        ),
        Container(
          alignment: Alignment.center,
          height: 213,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.black26),
        ),
        Positioned(bottom: 10, left: 3, right: 1, child: newsTitle(item))
      ]),
    );
  }

  bool isFeedEmpty() {
    // rssten veri gelip gelmediğinin kontrolü
    return null == _feed || null == _feed.items;
  }

  Widget body() {
    // Gelmediyse ortada yükleniyor işareti dönüyor. Geldiyse oluşturduğumuz list() yükleniyor.
    return isFeedEmpty() // kontrol
        ? Center(child: CircleAvatar())
        : RefreshIndicator(
            color: Colors.purple,
            key: _refreshKey,
            child: list(),
            onRefresh: () async =>
                load(), //ekranı yukarıdan çektiğimizde yeni veri geldiyse ana sayfamızın güncellenmesien yarar.
          );
  }

  @override
  Widget build(BuildContext context) {
    // standart kullanım
    return Scaffold(
      drawer: MyDrawer(
        rssUrl: rssurl,
      ),
      appBar: AppBar(
        actions: [
          _istListTile == false
              ? IconButton(
                  icon: Icon(Icons.list_alt_sharp),
                  onPressed: () {
                    setState(() {
                      _istListTile = true;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {
                    setState(() {
                      _istListTile = false;
                    });
                  }),

        ],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          '$_newsSite $_newsType',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: body(),
    );
  }
}