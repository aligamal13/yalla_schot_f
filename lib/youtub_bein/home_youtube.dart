import 'package:flutter/material.dart';
import 'package:yalla_kora/recources/color_managr.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreenBeinSport1 extends StatefulWidget {
  @override
  _YouTubeVideoScreenBeinSport1State createState() => _YouTubeVideoScreenBeinSport1State();
}

class _YouTubeVideoScreenBeinSport1State extends State<YouTubeVideoScreenBeinSport1> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'O_02mf1vpQo', // استبدل بـ ID الفيديو الخاص بك
      flags: YoutubePlayerFlags(
        autoPlay: true, // تشغيل الفيديو تلقائيًا
        enableCaption: false, // تعطيل الترجمة
        isLive: false,
        forceHD: true, // تشغيل الفيديو بجودة عالية
        hideControls: false, // إظهار عناصر التحكم
      ),
    );

    // تكبير الفيديو تلقائيًا عند فتحه
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.toggleFullScreenMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.celestial,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}



///////////////////////////////////*******************
//////////////////////***********************
//////////////////////**************







class YouTubeVideoScreenBeinSport2 extends StatefulWidget {
  @override
  _YouTubeVideoScreenBeinSport2State createState() => _YouTubeVideoScreenBeinSport2State();
}

class _YouTubeVideoScreenBeinSport2State extends State<YouTubeVideoScreenBeinSport2> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'rklYWxQZ6LU', // استبدل بـ ID الفيديو الخاص بك
      flags: YoutubePlayerFlags(
        autoPlay: true, // تشغيل الفيديو تلقائيًا
        enableCaption: false, // تعطيل الترجمة
        isLive: false,
        forceHD: true, // تشغيل الفيديو بجودة عالية
        hideControls: false, // إظهار عناصر التحكم
      ),
    );

    // تكبير الفيديو تلقائيًا عند فتحه
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.toggleFullScreenMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.celestial,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}






///////////////////////////////////*******************
//////////////////////***********************
//////////////////////**************







class YouTubeVideoScreenBeinSport3 extends StatefulWidget {
  @override
  _YouTubeVideoScreenBeinSport3State createState() => _YouTubeVideoScreenBeinSport3State();
}

class _YouTubeVideoScreenBeinSport3State extends State<YouTubeVideoScreenBeinSport3> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'S9v3Co6YvkY', // استبدل بـ ID الفيديو الخاص بك
      flags: YoutubePlayerFlags(
        autoPlay: true, // تشغيل الفيديو تلقائيًا
        enableCaption: false, // تعطيل الترجمة
        isLive: false,
        forceHD: true, // تشغيل الفيديو بجودة عالية
        hideControls: false, // إظهار عناصر التحكم
      ),
    );

    // تكبير الفيديو تلقائيًا عند فتحه
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.toggleFullScreenMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.celestial,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
