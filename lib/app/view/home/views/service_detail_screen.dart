import 'package:fix_store/app/data/data_file.dart';
import 'package:fix_store/app/models/model_category.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  SharedPreferences? selection;

  static List<ModelCategory> categoryLists = DataFile.categoryList;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      selection = sp;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = selection?.getInt("indexService") ?? 0;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen con gradiente y botón para regresar
            Container(
              height: MediaQuery.of(context).size.height *
                  0.5, // 50% de la pantalla
              width: double
                  .infinity, // Aseguramos que la imagen ocupe todo el ancho
              child: Stack(
                children: [
                  // Imagen de fondo
                  Positioned.fill(
                    child: Image.asset(
                      "${Constant.assetImagePath}${categoryLists[index].image}", // Cambia esto a tu ruta de imagen
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Gradiente de opacidad de arriba a abajo
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.3, 1],
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.5),
                            backGroundColor,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Botón de retroceso
                  Positioned(
                    top: 40, // Distancia desde la parte superior
                    left: 16, // Distancia desde la parte izquierda
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back, // Ícono de retroceso
                        color: Colors.white38, // Color del ícono
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Navega hacia atrás
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Texto debajo de la imagen
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: getCustomFont(
                    "${categoryLists[index].name}", 20, textColor, 2,
                    textAlign: TextAlign.start)),

            // Otros componentes debajo del texto
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(child: Text("Componente 1")),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 100,
                    color: Colors.green,
                    child: Center(child: Text("Componente 2")),
                  ),
                  // Agrega más componentes aquí
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(child: Text("Componente 1")),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 100,
                    color: Colors.green,
                    child: Center(child: Text("Componente 2")),
                  ),
                  // Agrega más componentes aquí
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(child: Text("Componente 1")),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 100,
                    color: Colors.green,
                    child: Center(child: Text("Componente 2")),
                  ),
                  // Agrega más componentes aquí
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
