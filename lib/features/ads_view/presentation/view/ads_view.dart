import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';

class AdsView extends StatefulWidget {
  const AdsView({super.key});

  @override
  State<AdsView> createState() => _AdsViewState();
}
BannerAd? banner;
bool isloaded= false;


class _AdsViewState extends State<AdsView> {
  void loadAd(){
  banner = BannerAd(size: AdSize.mediumRectangle, adUnitId: AdsHelper.bannerTestId, 
  listener: BannerAdListener(
    onAdLoaded: (ad) {
      
      log("loaded");
      setState(() {
        isloaded=true;
      });
    },
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      log("failed: $error");

    },

  ), 
  request: const AdRequest())..load();
}
@override
  void initState() {
    loadAd();
    super.initState();
  }
  @override
  void dispose() {
    if(isloaded){
      banner!.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return isloaded? SizedBox(
      width: banner!.size.width.toDouble(),
      height: banner!.size.height.toDouble(),
      child: AdWidget(
        ad: banner!)):const SizedBox();
  }
}