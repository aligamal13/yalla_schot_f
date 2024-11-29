import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';











////////////////////////////
/////////////////////
/////////////////
//////////////
















/////////////////////////////////
//////////////////////////////
///////////////////////////







/////////////////////////////////
//////////////////////////////
///////////////////////////






/////////////////////////////////
//////////////////////////////
///////////////////////////





/////////////////////////////////
//////////////////////////////
///////////////////////////






/////////////////////////////////
//////////////////////////////
///////////////////////////







/////////////////////////////////
//////////////////////////////
///////////////////////////




/////////////////////////////////
//////////////////////////////
///////////////////////////








/////////////////////////////////
//////////////////////////////
///////////////////////////










/////////////////////////////////
//////////////////////////////
///////////////////////////


class WidgetCoraOnlineLive extends StatefulWidget {
  dynamic url,title;
  WidgetCoraOnlineLive(this.url,this.title);
  @override
  _WidgetCoraOnlineLiveState createState() => _WidgetCoraOnlineLiveState();
}

class _WidgetCoraOnlineLiveState extends State<WidgetCoraOnlineLive> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView(); // تحسين الأداء على Android
  }

  Future<bool> _onWillPop() async {
    // إذا كانت هناك صفحة سابقة يمكن الرجوع إليها
    if (await _controller.canGoBack()) {
      _controller.goBack();  // العودة إلى الصفحة السابقة
      return Future.value(false);  // لا نغادر التطبيق
    } else {
      return Future.value(true);  // إذا لم تكن هناك صفحة سابقة، نغادر التطبيق
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,  // التحكم في زر الرجوع في الهاتف
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: WebView(
            initialUrl: widget.url,

            javascriptMode: JavascriptMode.unrestricted,  // تفعيل جافا سكربت
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;

            },
            gestureNavigationEnabled: true, // تمكين السحب للتنقل داخل WebView

          ),
        ),
      ),
    );
  }
}





