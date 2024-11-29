import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_kora/pages/splach/splash.dart';
import 'package:yalla_kora/pages/tab_par_data1.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  UnityAds.init(
    gameId: '5740160',
  );
  // await Firebase.initializeApp();
  // FirebaseMessaging.instance.subscribeToTopic("LifeCora");
  //
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);




  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'بث مباشر',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}





void navgiTo(context, Widget screen) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ));


Widget Icondefult() => Icon(Icons.wifi_off_outlined, size: 70);





//dark
















