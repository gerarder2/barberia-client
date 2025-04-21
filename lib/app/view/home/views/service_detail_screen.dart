import 'package:fix_store/app/data/data_file.dart';
import 'package:fix_store/app/models/model_category.dart';
import 'package:fix_store/app/routes/app_routes.dart';
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Stack(
                children: [
                  // Imagen de fondo
                  Positioned.fill(
                    child: Image.asset(
                      "${Constant.assetImagePath}${categoryLists[index].image}",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.3, 1],
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.5),
                            backGroundColor,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Botón de retroceso
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white38,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: getCustomFont(
                    "${categoryLists[index].name}", 25, Colors.white70, 2)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: getCustomFont("${categoryLists[index].description}",
                        16, textColor, 100,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(85),
              width: FetchPixels.getPixelWidth(350),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: getButton(
                      context, brownColor, "Lo Quiero!", Colors.white, () {
                    Constant.sendToNext(context, Routes.homeScreenRoute);
                  }, 16, borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
    );
  }
}
