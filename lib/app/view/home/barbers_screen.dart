import 'package:fix_store/app/data/data_file.dart';
import 'package:fix_store/app/models/model_barberos.dart';
import 'package:fix_store/app/models/model_category.dart';
import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/app/view/home/detail_screen.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/device_util.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BarbersScreen extends StatefulWidget {
  const BarbersScreen({super.key});

  @override
  State<BarbersScreen> createState() => _BarbersScreenState();
}

class _BarbersScreenState extends State<BarbersScreen> {
  static List<BarberosModel> categoryLists = DataFile.barberList;
  SharedPreferences? selection;
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      selection = sp;
      setState(() {});
    });
  }

  var noOfGrid = 3;

  @override
  Widget build(BuildContext context) {
    if (DeviceUtil.isTablet) {
      noOfGrid = 6;
    }
    FetchPixels(context);
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          body: SafeArea(
            child: Column(
              children: [
                getVerSpace(FetchPixels.getPixelHeight(20)),
                getPaddingWidget(
                  EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(20)),
                  gettoolbarMenu(context, "back.svg", () {
                    Constant.backToPrev(context);
                  },
                      istext: true,
                      title: "Barberos",
                      fontsize: 24,
                      weight: FontWeight.w800,
                      textColor: whiteColor),
                ),
                getVerSpace(FetchPixels.getPixelHeight(32)),
                Expanded(
                  child: categoryView(),
                  flex: 1,
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        });
  }

  AnimationLimiter categoryView() {
    return AnimationLimiter(
      child: GridView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        primary: true,
        itemCount: categoryLists.length,
        itemBuilder: (context, index) {
          BarberosModel modelCategory = categoryLists[index];
          return GestureDetector(
            onTap: () {
              // showModalBottomSheet(
              //     backgroundColor: backGroundColor,
              //     isDismissible: false,
              //     isScrollControlled: true,
              //     context: context,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(FetchPixels.getPixelHeight(40)),
              //       ),
              //     ),
              //     builder: (context) {
              //       return CategoryDialog();
              //     });
              // Constant.sendToNext(context, Routes.detailRoute);
              selection?.setInt("index", index);
              Constant.sendToNext(context, Routes.detailRoute,
                  arguments: ScreenArguments(index, modelCategory));
            },
            child: AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 300),
              columnCount: noOfGrid,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Hero(
                    tag: index,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: FetchPixels.getPixelHeight(24),
                          bottom: FetchPixels.getPixelHeight(16)),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${Constant.assetImagePath}"
                                "${modelCategory.image}"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black
                                  .withOpacity(0.35), // Ajusta la opacidad aquí
                              BlendMode.darken, // Modo para oscurecer
                            ),
                          ),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0.0, 4.0)),
                          ],
                          borderRadius: BorderRadius.circular(
                              FetchPixels.getPixelHeight(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // getAssetImage(
                          //     modelCategory.image ?? "",
                          //     FetchPixels.getPixelHeight(44),
                          //     FetchPixels.getPixelHeight(44),
                          //     boxFit: BoxFit.cover),
                          // getSvgImage(modelCategory.image ?? "",
                          //     width: FetchPixels.getPixelHeight(44),
                          //     height: FetchPixels.getPixelHeight(44)),
                          getVerSpace(FetchPixels.getPixelHeight(15)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: getCustomFont(
                                modelCategory.nombre ?? '', 14, Colors.white, 1,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: noOfGrid,
            crossAxisSpacing: FetchPixels.getPixelWidth(19),
            mainAxisSpacing: FetchPixels.getPixelHeight(20),
            mainAxisExtent: FetchPixels.getPixelHeight(121)),
      ),
    );
  }
}
