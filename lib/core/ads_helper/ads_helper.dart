import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  static const String bannerTestId = "ca-app-pub-3940256099942544/9214589741";
  static const String interstialTestId = "ca-app-pub-3940256099942544/1033173712";
  static const String rewardedInterstialTestId = "ca-app-pub-3940256099942544/5354046379";
  InterstitialAd? _interstitialAd;
  RewardedInterstitialAd? rewardedAd;


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
   RewardedInterstitialAd.load(adUnitId: rewardedInterstialTestId, 
  request: const AdRequest(), 
  rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(onAdLoaded: (ad) {
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
