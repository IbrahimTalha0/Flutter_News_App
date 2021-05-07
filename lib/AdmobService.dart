import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdvertService {
  showInsterstitialAd(){
    final InterstitialAd myInterstitial = InterstitialAd(
  adUnitId: "ca-app-pub-5907477366910917/3571330107",
  request: AdRequest(),
  listener: AdListener(// Called when an ad is successfully received.
 onAdLoaded: (Ad ad) => print('Ad loaded.'),
 // Called when an ad request failed.
 onAdFailedToLoad: (Ad ad, LoadAdError error) {
   ad.dispose();
   print('Ad failed to load: $error');
 },
 // Called when an ad opens an overlay that covers the screen.
 onAdOpened: (Ad ad) => print('Ad opened.'),
 // Called when an ad removes an overlay that covers the screen.
 onAdClosed: (Ad ad) {
   ad.dispose();
   print('Ad closed.');
 },
 // Called when an ad is in the process of leaving the application.
 onApplicationExit: (Ad ad) => print('Left application.'),),
);
  myInterstitial..load()..show();

  }

  
}