import 'package:fix_store/app/view/home/tab/tab_bookings.dart';
import 'package:fix_store/app/view/home/tab/tab_home.dart';
import 'package:fix_store/app/view/home/tab/tab_profile.dart';
import 'package:fix_store/app/view/home/tab/tab_schedule.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';

import '../../../base/constant.dart';

class HomeScreen extends StatefulWidget {
  int index;

  HomeScreen(this.index, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? index;
  List<Widget> tabList = [
    const TabHome(),
    const TabBookings(),
    const TabSchedule(),
    const TabProfile(),
  ];

  List<String> itemList = [
    "home.svg",
    "documnet.svg",
    "calender.svg",
    "profile.svg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    position = index!;
  }

  int position = 0;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: botonFlotante(),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: SafeArea(
            child: tabList[position],
          ),
          bottomNavigationBar: bottomNavigationBar(),
        ),
        onWillPop: () async {
          Constant.closeApp();
          return false;
        });
  }

  Container bottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(25)),
      height: FetchPixels.getPixelHeight(100),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 10, offset: Offset(0.0, 4.0)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(itemList.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                position = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: position == index
                      ? Colors.transparent
                      : Colors.transparent,
                  shape: BoxShape.circle),
              child: Padding(
                padding: EdgeInsets.all(FetchPixels.getPixelHeight(13)),
                child: getSvgImage(itemList[index],
                    width: FetchPixels.getPixelHeight(30),
                    height: FetchPixels.getPixelHeight(30),
                    color: position == index ? brownColor : Colors.white),
              ),
            ),
          );
        }),
      ), // child: BottomNavigationBar(
    );
  }

  FloatingActionButton botonFlotante() {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: () {},
      backgroundColor: brownColor,
      child: getSvgImage("qrsvg.svg", color: Colors.white),
    );
  }
}
