
import 'package:flutter/material.dart';
import 'package:yalla_kora/pages/page.dart';
import 'package:yalla_kora/recources/color_managr.dart';

import 'package:fluttertoast/fluttertoast.dart';


DateTime timePresd = DateTime.now();


class TabBarAll extends StatelessWidget {
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
      child: DefaultTabController(
        length: 3, // عدد التبويبات
        child: Scaffold(
          appBar: AppBar(
            title: Text( "بث مباشر كوره",style: TextStyle(
              color: ColorManager.white,
              fontSize: 21,
              fontWeight: FontWeight.w900
            ),),centerTitle: true,
            backgroundColor: ColorManager.app,
            bottom: TabBar(
              physics: BouncingScrollPhysics(),
              indicator: BoxDecoration(
                  color: ColorManager.erorr,
                  borderRadius: BorderRadius.circular(20)
              ),
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: ColorManager.white,
              isScrollable: true,

              tabs: [
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Text("بث مباشر 1",style: TextStyle(color: ColorManager.white,fontWeight: FontWeight.w900,fontSize: 18),),
                    SizedBox(width: 5,),

                  ],
                ),

                Row(
                  children: [
                    SizedBox(width: 5,),
                       Text("بث مباشر 2",style: TextStyle(color: ColorManager.white,fontWeight: FontWeight.w900,fontSize: 18),),
                     SizedBox(width: 5,),

                  ],
                ),
                Tab(icon: Icon(Icons.live_tv,color: ColorManager.white,), text: "بث اسبورت",),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: TabBarView(
              children: [

                HomePage(),
                HomePageLive2(),
                HomePageSport()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
