import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController nameCtrl = TextEditingController();
TextEditingController emailCtrl = TextEditingController();
TextEditingController mobileCtrl = TextEditingController();
TextEditingController passwordCtrl = TextEditingController();
TextEditingController repeatPassCtrl = TextEditingController();
FocusNode nameNode = FocusNode();
FocusNode emailNode = FocusNode();
FocusNode passNode = FocusNode();
FocusNode rpassNode = FocusNode();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: FetchPixels.getHeightPercentSize(100),
          decoration: BoxDecoration(
              image: DecorationImage(
                  // colorFilter:
                  //     ColorFilter.mode(Colors.black45, BlendMode.colorBurn),
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "${Constant.assetImagePath}registerBackground.jpg")),
              gradient: LinearGradient(
                colors: [Colors.black, const Color.fromARGB(239, 0, 0, 0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getCustomFont("Crear Cuenta", 22, Colors.white, 2),
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
                          'Nombre',
                          nameCtrl,
                          Colors.white,
                          nameNode,
                          function: () {},
                          isEnable: false,
                        ),
                      ),
                      getVerSpace(12),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(350),
                        child: getDefaultTextFiledWithLabel(
                          context,
                          'Correo',
                          emailCtrl,
                          Colors.white,
                          emailNode,
                          function: () {},
                          isEnable: false,
                        ),
                      ),
                      getVerSpace(12),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(350),
                        child: getDefaultTextFiledWithLabel(context,
                            'contraseña', passwordCtrl, Colors.white, passNode,
                            function: () {}, isEnable: false, isPass: true),
                      ),
                      getVerSpace(12),
                      SizedBox(
                        width: FetchPixels.getPixelWidth(350),
                        child: getDefaultTextFiledWithLabel(
                          context,
                          'Repite Contraseña',
                          repeatPassCtrl,
                          Colors.white,
                          rpassNode,
                          function: () {},
                          isEnable: false,
                          isPass: true,
                        ),
                      ),
                      getVerSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomFont(
                            "¿YA CUENTAS CON UN USUARIO?",
                            11,
                            Colors.white,
                            1,
                            fontWeight: FontWeight.w100,
                          ),
                          // getVerSpace(FetchPixels.getPixelHeight(50)),
                          GestureDetector(
                            onTap: () {
                              Constant.sendToNext(context, Routes.loginRoute);
                            },
                            child: getCustomFont(
                              " INICIA SESION",
                              14,
                              Colors.white,
                              1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      getVerSpace(100),
                      getButton(
                          context, brownColor, "Registrarse", Colors.white70,
                          () {
                        Constant.sendToNext(context, Routes.loginRoute);
                      }, 17,
                          buttonWidth: FetchPixels.getPixelWidth(220),
                          buttonHeight: FetchPixels.getPixelHeight(45),
                          borderRadius: BorderRadius.circular(50)),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
