import 'package:flutter/material.dart';
import 'package:yalla_kora/recources/color_managr.dart';

class CustumSliverAppBar1 extends StatefulWidget {
  String title;
  double size;

  CustumSliverAppBar1(this.title,this.size,);
  @override
  State<CustumSliverAppBar1> createState() => _CustumSliverAppBar1State();
}

class _CustumSliverAppBar1State extends State<CustumSliverAppBar1> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: ColorManager.white
      ),
      backgroundColor: ColorManager.app,
      floating: true,
      leadingWidth: 100,
      title: FittedBox(
        fit: BoxFit.scaleDown,

        child: Text(widget.title,
          style: TextStyle(fontSize: widget.size,
              fontWeight: FontWeight.w900,
            color:ColorManager.white
          ),
        ),
      ),
      centerTitle: true,
      actions: [



      ],
    );
  }
}




