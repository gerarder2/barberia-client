import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/pref_data.dart';
import '../../../base/widget_utils.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void finishView() {
    Constant.closeApp();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black,
                      Colors.black54,
                      Colors.black12
                    ]),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.colorBurn),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                  image:
                      AssetImage('${Constant.assetImagePath}barber-intro.jpg'),
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getDefaultHorSpace(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListBody(
                    children: [
                      getVerSpace(FetchPixels.getPixelHeight(20)),
                      Align(
                        alignment: Alignment.topLeft,
                        child: getCustomFont(
                            "VICIO DE VERTE BIEN.", 70, Colors.white, 3,
                            fontWeight: FontWeight.w600, txtHeight: 0.0),
                      ),
                      getVerSpace(FetchPixels.getPixelHeight(10)),
                      Align(
                        alignment: Alignment.topLeft,
                        child: getCustomFont(
                          "Es más que un corte de cabello.",
                          21,
                          Colors.white,
                          2,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  ListBody(
                    children: [
                      getDefaultTextFiledWithLabel(
                          context, "Correo", emailController, Colors.white,
                          function: () {}, isEnable: false),
                      getVerSpace(12),
                      getDefaultTextFiledWithLabel(context, "Contraseña",
                          passwordController, Colors.white38,
                          function: () {}, isEnable: false, isPass: true),
                      getVerSpace(25),
                      getButton(
                          context, brownColor, "Iniciar sesión", Colors.white,
                          () {
                        PrefData.setLogIn(true);
                        Constant.sendToNext(context, Routes.homeScreenRoute);
                      }, 18,
                          weight: FontWeight.w600,
                          buttonHeight: FetchPixels.getPixelHeight(60),
                          borderRadius: BorderRadius.circular(
                              FetchPixels.getPixelHeight(50))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomFont(
                            "¿AÚN SIN CUENTA?",
                            14,
                            Colors.white,
                            1,
                            fontWeight: FontWeight.w100,
                          ),
                          getVerSpace(FetchPixels.getPixelHeight(50)),
                          GestureDetector(
                            onTap: () {
                              Constant.sendToNext(
                                  context, Routes.registerRoute);
                            },
                            child: getCustomFont(
                              " CREAR UNA",
                              16,
                              Colors.white,
                              1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      getVerSpace(FetchPixels.getPixelHeight(20)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          finishView();
          return false;
        });
  }
}
