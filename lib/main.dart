import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


import 'package:news/pages/categoryNews.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      themes: [
        AppTheme.dark(),
        AppTheme.light(),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Projem',
            theme: ThemeProvider.themeOf(themeContext).data,
            home: NewsPage(
              rssUrl: "https://t24.com.tr/rss",
              newsType: "Haberler",
              newsSite: "T24",
              isListTile: true,
            ),
          ),
        ),
      ),
    );
  }
}
