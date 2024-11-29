
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UnityAdsExample extends StatefulWidget {

  @override
  _UnityAdsExampleState createState() => _UnityAdsExampleState();
}

class _UnityAdsExampleState extends State<UnityAdsExample> {
  bool _showBanner = false;
  Map<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: false,
    AdManager.rewardedVideoAdPlacementId: false,
  };

  @override
  void initState() {
    super.initState();
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
        print('Initialization Complete');
        _loadAds();
      },
      onFailed: (error, message) => print('Initialization Failed: $error $message'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: () {
      _showAd(
          AdManager.interstitialVideoAdPlacementId);
    //  navgiTo(context, FrinschsPageSports());
    }, child: Text("data"));

// AdInterIsteilBotomShet.loadInterStiAd();
  }




  void _loadAds() {
    for (var placementId in placements.keys) {
      _loadAd(placementId);
    }
  }

  void _loadAd(String placementId) {
    UnityAds.load(
      placementId: placementId,
      onComplete: (placementId) {
        print('Load Complete $placementId');
        setState(() {
          placements[placementId] = true;
        });
      },
      onFailed: (placementId, error, message) => print('Load Failed $placementId: $error $message'),
    );
  }

  void _showAd(String placementId) {
    setState(() {
      placements[placementId] = false;
    });
    UnityAds.showVideoAd(
      placementId: placementId,
      onComplete: (placementId) {
        print('Video Ad $placementId completed');
        _loadAd(placementId);
      },
      onFailed: (placementId, error, message) {
        print('Video Ad $placementId failed: $error $message');
        _loadAd(placementId);
      },
      onStart: (placementId) => print('Video Ad $placementId started'),
      onClick: (placementId) => print('Video Ad $placementId click'),
      onSkipped: (placementId) {
        print('Video Ad $placementId skipped');
        _loadAd(placementId);
      },
    );
  }
}





















//////test

class AdManagertest {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '5447483';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 'your_ios_game_id';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'b5';
  }

  static String get interstitialVideoAdPlacementId {
    return 'i55';
  }

  static String get rewardedVideoAdPlacementId {
    return 'r55';
  }
}




/////////





///////////////////LitsGo

//5448033
class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '5740160';
    }
    // if (defaultTargetPlatform == TargetPlatform.iOS) {
    //   return 'your_ios_game_id';
    // }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'b1';
  }

  static String get interstitialVideoAdPlacementId {
    return 'v12';
  }

  static String get rewardedVideoAdPlacementId {
    return 'rv1';
  }
}

Widget unityBinner() =>
    SizedBox(child: UnityBannerAd(placementId: AdManager.bannerAdPlacementId));

loadUnity() {
  UnityAds.load(placementId: AdManager.interstitialVideoAdPlacementId);
  UnityAds.load(placementId: AdManager.rewardedVideoAdPlacementId);
  UnityAds.load(placementId: AdManager.bannerAdPlacementId);
}
































