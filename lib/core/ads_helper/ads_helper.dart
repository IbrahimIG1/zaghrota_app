import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  static const String bannerTestId = "ca-app-pub-6783789872524961/3099215367";
  static const String interstialTestId = "ca-app-pub-6783789872524961/2252704418";
  // ca-app-pub-6783789872524961/2252704418
  static const String rewardedInterstialTestId = "ca-app-pub-6783789872524961/6028570964";
  InterstitialAd? _interstitialAd;
  RewardedAd? rewardedAd;


  void interstitialAdshow(){
   log("start ad");
  InterstitialAd.load(adUnitId: interstialTestId, 
  request: AdRequest(), 
  adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
    _interstitialAd=ad;
    if(_interstitialAd!=null){
      _interstitialAd!.show();
    }
    ad.fullScreenContentCallback=FullScreenContentCallback(
      onAdWillDismissFullScreenContent: (ad) {
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
      },
    );
  }, onAdFailedToLoad: (error) {
    log(error.toString());
  },));
  }



  void interstitialRewardedAdshow(){
   log("hereee");
   RewardedAd.load(

    adUnitId: rewardedInterstialTestId, 
  request: const AdRequest(), 
  rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
    rewardedAd=ad;
    if(rewardedAd!=null){
      rewardedAd!.show(onUserEarnedReward: (ad, reward) {
        
      },);
    }
    ad.fullScreenContentCallback=FullScreenContentCallback(
      onAdWillDismissFullScreenContent: (ad) {
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
      },
    );
  }, onAdFailedToLoad: (error) {
    log(error.toString());
  },));
  }
}
