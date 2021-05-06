import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowNews extends StatelessWidget {
  final RssItem item;

  const ShowNews({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: (){
              Share.share(item.link);
            },
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(item.link.toString(),  style: TextStyle(color: Colors.black))
      ),
      body: WebView(
        
        initialUrl: item.link,
      ),
    );
  }
}