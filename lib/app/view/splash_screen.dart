import 'dart:async';
import 'dart:math';

import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';

import '../../base/constant.dart';
import '../../base/pref_data.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    PrefData.isLogIn().then((value) {
      Timer(
        const Duration(seconds: 3),
        () {
          (value)
              ? Constant.sendToNext(context, Routes.homeScreenRoute)
              : Constant.sendToNext(context, Routes.loginRoute);
        },
      );
    });
  }

  void backClick() {
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            color: backGroudAux,
            child: Center(
                child: getAssetImage(
                    "logotipo.png",
                    FetchPixels.getPixelHeight(180),
                    FetchPixels.getPixelHeight(180))),
          ),
        ),
        onWillPop: () async {
          backClick();
          return false;
        });
  }
}
