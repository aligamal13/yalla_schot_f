
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yalla_kora/main.dart';
import 'package:yalla_kora/model/modeil.dart';
import 'package:yalla_kora/pages/list/yallaSchot.dart';
import 'package:yalla_kora/recources/color_managr.dart';
import 'package:yalla_kora/unity_ads/unityads.dart';
import 'package:yalla_kora/youtub_bein/home_youtube.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';


//https://en.yallashoott.com/

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> ListScrent = [
    WidgetCoraOnlineLive('https://gol.yalla-shoot-as.com/home1/', 1),

   WidgetCoraOnlineLive('https://shotz.yalla-shoot-tv.live/', 2),
   WidgetCoraOnlineLive('https://kooora.live-koora.live/', 3),
   WidgetCoraOnlineLive('https://stars.yallakorastar.com/', 4),
   WidgetCoraOnlineLive('https://cdn.okkora.com/', 5),
   WidgetCoraOnlineLive('https://livehd7.ws/', 6),
   WidgetCoraOnlineLive('https://www.koora-live.fun/', 7),
   WidgetCoraOnlineLive('https://www.hd-kora.live/', 8),
   WidgetCoraOnlineLive('https://kooora.yallashoot-live.today/', 9),
   WidgetCoraOnlineLive('https://www.fel3arda.cc/', 10),


];
  bool _showBanner = false;
  Map<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: false,
    AdManager.rewardedVideoAdPlacementId: false,
  };

@override
  void initState() {
    // TODO: implement initState
  UnityAds.init(
    gameId: AdManager.gameId,
    testMode: true,
    onComplete: () {
      print('Initialization Complete');
      _loadAds();
    },
    onFailed: (error, message) => print('Initialization Failed: $error $message'),
  );

  UnityAds.load(
      placementId: AdManager
          .interstitialVideoAdPlacementId);

  super.initState();
  }

  DateTime timePresd = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      final difference = DateTime.now().difference(timePresd);
      final isExitWaring = difference >= Duration(seconds: 2);
      timePresd = DateTime.now();
      if (isExitWaring) {
        final message = "اضغط مره اخره للخروج";
        Fluttertoast.showToast(msg: message, fontSize: 14);
        return false;
      } else {
        Fluttertoast.cancel();
        return true;
      }
    },

      child: Scaffold(
          backgroundColor: ColorManager.gray1,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, ),
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3.5.w / 3.4.h,
                              crossAxisSpacing: 9.sp,
                            ),
                            itemCount: ModeilImage1.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                    setState(() {
                                       _loadAd(AdManager.interstitialVideoAdPlacementId);
                                       _showAd(
                                           AdManager.interstitialVideoAdPlacementId);
                                    });
                                     navgiTo(context, ListScrent[index]);
                                      },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: ColorManager.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffBCB6B6),
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  CachedNetworkImage(
                                                      imageUrl: ModeilImage1[index].Image.toString(),
                                                      fit: BoxFit.fill,
                                                      height: 130.h,
                                                      width: double.infinity,
                                                      placeholder:
                                                          (context, url) =>
                                                          SizedBox(
                                                            child: Center(
                                                                child: CircularProgressIndicator
                                                                    .adaptive(
                                                                  backgroundColor:
                                                                  ColorManager
                                                                      .erorr,
                                                                )),
                                                          ),
                                                      errorWidget:
                                                          (context, url, error) =>
                                                          Icondefult()),

                                                ],
                                              ),
                                              SizedBox(
                                                height: 4,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 200,
                                                color:
                                                Colors.black,
                                                child: Center(
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                        ModeilImage1[index].title.toString(),
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                            color:
                                                            ColorManager
                                                                .white,
                                                            //fontSize: 12,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  ),
                )
              ]),

      //disun

              // SizedBox(
              //   height:50,
              //   child: AppodealBanner(adSize: AppodealBannerSize.BANNER),),

              unityBinner(),
            ],
          )),
    );
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






/////////////////////////****************
//////////////////////////////*****************
///////////////////////////************



class HomePageSport extends StatefulWidget {

  @override
  State<HomePageSport> createState() => _HomePageSportState();
}

class _HomePageSportState extends State<HomePageSport> {
  List<Widget> ListScrent = [
    YouTubeVideoScreenBeinSport1(),
    YouTubeVideoScreenBeinSport2(),
    YouTubeVideoScreenBeinSport3(),

  ];
  bool _showBanner = false;
  Map<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: false,
    AdManager.rewardedVideoAdPlacementId: false,
  };

  @override
  void initState() {
    // TODO: implement initState
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
        print('Initialization Complete');
        _loadAds();
      },
      onFailed: (error, message) => print('Initialization Failed: $error $message'),
    );

    UnityAds.load(
        placementId: AdManager
            .interstitialVideoAdPlacementId);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.gray1,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, ),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,

                          itemCount: ModeilImage2.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _loadAd(AdManager.interstitialVideoAdPlacementId);
                                        _showAd(
                                            AdManager.interstitialVideoAdPlacementId);
                                      });
                                      navgiTo(context, ListScrent[index]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: ColorManager.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffBCB6B6),
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  CachedNetworkImage(
                                                      imageUrl: ModeilImage2[index].Image.toString(),
                                                      fit: BoxFit.fill,
                                                      height: 130.h,
                                                      width: double.infinity,
                                                      placeholder:
                                                          (context, url) =>
                                                          SizedBox(
                                                            child: Center(
                                                                child: CircularProgressIndicator
                                                                    .adaptive(
                                                                  backgroundColor:
                                                                  ColorManager
                                                                      .erorr,
                                                                )),
                                                          ),
                                                      errorWidget:
                                                          (context, url, error) =>
                                                          Icondefult()),

                                                ],
                                              ),
                                              SizedBox(
                                                height: 4,
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                color:
                                                Colors.black,
                                                child: Center(
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                        ModeilImage2[index].title.toString(),
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                            color:
                                                            ColorManager
                                                                .white,
                                                            //fontSize: 12,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              )
            ]),

//disun

            // SizedBox(
            //   height:50,
            //   child: AppodealBanner(adSize: AppodealBannerSize.BANNER),),

            unityBinner(),
          ],
        ));
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






/////////////////////////****************
//////////////////////////////*****************
///////////////////////////************


class HomePageLive2 extends StatefulWidget {

  @override
  State<HomePageLive2> createState() => _HomePageLive2State();
}

class _HomePageLive2State extends State<HomePageLive2> {
  List<Widget> ListScrent = [
    WidgetCoraOnlineLive('https://yalla-shoots.video/',1),
    WidgetCoraOnlineLive('https://www.ysscores.com/',2),
    WidgetCoraOnlineLive('https://yallalive.sx/',3),
    WidgetCoraOnlineLive('https://v1.koora-sport.com/p/yallasport-yalla-sport.html',4),
    WidgetCoraOnlineLive('https://en.yalla--live.net/',5),
    WidgetCoraOnlineLive('https://www.yalla-live-hd7.com/',6),
    WidgetCoraOnlineLive('https://shotz.yalla-shoot-tv.live/kora360/',7),
    WidgetCoraOnlineLive('https://yal1a.maxsp0orts.com/',8),
    WidgetCoraOnlineLive('https://shotz.yalla-shoot-tv.live/dotsport/',9),
    WidgetCoraOnlineLive('https://kooracity.cc/yallasport/',10),

  ];
  bool _showBanner = false;
  Map<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: false,
    AdManager.rewardedVideoAdPlacementId: false,
  };

  @override
  void initState() {
    // TODO: implement initState
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
        print('Initialization Complete');
        _loadAds();
      },
      onFailed: (error, message) => print('Initialization Failed: $error $message'),
    );

    UnityAds.load(
        placementId: AdManager
            .interstitialVideoAdPlacementId);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.gray1,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, ),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.5.w / 3.4.h,
                            crossAxisSpacing: 9.sp,
                          ),
                          itemCount: ModeilImage1.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                       _loadAd(AdManager.interstitialVideoAdPlacementId);
                                       _showAd(
                                           AdManager.interstitialVideoAdPlacementId);
                                    });
                                    navgiTo(context, ListScrent[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: ColorManager.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffBCB6B6),
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                CachedNetworkImage(
                                                    imageUrl: assetsConverstion().yalla2.toString(),
                                                    fit: BoxFit.fill,
                                                    height: 130.h,
                                                    width: double.infinity,
                                                    placeholder:
                                                        (context, url) =>
                                                        SizedBox(
                                                          child: Center(
                                                              child: CircularProgressIndicator
                                                                  .adaptive(
                                                                backgroundColor:
                                                                ColorManager
                                                                    .erorr,
                                                              )),
                                                        ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                        Icondefult()),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 200,
                                              color:
                                              Colors.orange,
                                              child: Center(
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                      ModeilImage1[index].title.toString(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                          color:
                                                          ColorManager
                                                              .white,
                                                          //fontSize: 12,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              )
            ]),

//disun

            // SizedBox(
            //   height:50,
            //   child: AppodealBanner(adSize: AppodealBannerSize.BANNER),),

            unityBinner(),
          ],
        ));
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














