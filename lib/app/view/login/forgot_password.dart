import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtrl = TextEditingController();
  FocusNode emailNode = FocusNode();

  void _mostrarPopupConfirmacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          title: getCustomFont(
            "¿Estás seguro?",
            18,
            whiteColor,
            2,
            fontWeight: FontWeight.w600,
          ),
          content: getCustomFont(
            "Se enviarán instrucciones a tu correo.",
            15,
            whiteColor,
            3,
          ),
          actions: [
            TextButton(
              child: getCustomFont("Cancelar", 14, whiteColor, 1,
                  fontWeight: FontWeight.w400),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: getCustomFont("Aceptar", 14, whiteColor, 1,
                  fontWeight: FontWeight.w500),
              onPressed: () {
                Navigator.of(context).pop();
                Constant.sendToNext(context, Routes.loginRoute);
              },
            ),
          ],
        );
      },
    );
  }

  void _validarYMostrarPopup() {
    if (emailCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: getCustomFont(
            "Por favor, ingresa tu correo.",
            14,
            Colors.white,
            2,
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      _mostrarPopupConfirmacion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: FetchPixels.getHeightPercentSize(100),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "${Constant.assetImagePath}registerBackground.jpg",
              ),
            ),
            gradient: LinearGradient(
              colors: [Colors.black, const Color.fromARGB(239, 0, 0, 0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getCustomFont("Recuperar cuenta", 22, whiteColor, 2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          width: FetchPixels.getPixelWidth(350),
                          child: getDefaultTextFiledWithLabel(
                            context,
                            'Introduce tu correo',
                            emailCtrl,
                            whiteColor,
                            emailNode,
                            function: () {},
                            isEnable: false,
                          ),
                        ),
                        getVerSpace(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getCustomFont(
                              "¿YA CUENTAS CON UN USUARIO?",
                              11,
                              whiteColor,
                              1,
                              fontWeight: FontWeight.w100,
                            ),
                            GestureDetector(
                              onTap: () {
                                Constant.sendToNext(context, Routes.loginRoute);
                              },
                              child: getCustomFont(
                                " INICIA SESIÓN",
                                14,
                                whiteColor,
                                1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(100),
                        getButton(
                          context,
                          brownColor,
                          "Recuperar",
                          Colors.white70,
                          _validarYMostrarPopup,
                          17,
                          buttonWidth: FetchPixels.getPixelWidth(220),
                          buttonHeight: FetchPixels.getPixelHeight(45),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
