import 'package:fix_store/app/data/data_file.dart';
import 'package:fix_store/app/models/model_barberos.dart';
import 'package:fix_store/app/models/model_category.dart';

import 'package:fix_store/app/models/model_popular_service.dart';
import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/app/view/home/detail_screen.dart';
import 'package:fix_store/app/view/home/widgets/main_appbar.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  TextEditingController searchController = TextEditingController();
  static List<ModelCategory> categoryLists = DataFile.categoryList;
  List<ModelPopularService> popularServiceLists = DataFile.popularServiceList;
  List<BarberosModel> barberosList = DataFile.barberList;
  ValueNotifier selectedPage = ValueNotifier(0);
  final _controller = PageController();
  SharedPreferences? selection;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      selection = sp;
      setState(() {});
    });
  }

  List<String> satisfechos = [
    "satisfecho1.jpg",
    "satisfecho2.jpg",
    "satisfecho3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, // Comienza desde arriba
          end: Alignment.bottomCenter, // Termina abajo
          colors: [
            Colors.black,
            Color(0xFF111111)
          ], // Gradiente de negro a #111111
        ),
      ),
      child: Column(
        children: [
          getVerSpace(FetchPixels.getPixelHeight(21)),
          MainAppbar(),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          getPaddingWidget(
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
              getSearchWidget(context, searchController,
                  focusController: focusNode, () {
                Constant.sendToNext(context, Routes.searchRoute);
              }, (value) {})),
          getVerSpace(FetchPixels.getPixelHeight(20)),
          Expanded(
            flex: 1,
            child: ListView(
              primary: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                getVerSpace(FetchPixels.getPixelHeight(24)),
                getPaddingWidget(
                  EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getCustomFont("Servicios", 20, Colors.white70, 1,
                          fontWeight: FontWeight.w600),
                      GestureDetector(
                        onTap: () {
                          Constant.sendToNext(context, Routes.categoryRoute);
                        },
                        child: getCustomFont("Ver todos", 14, brownColor, 1,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(16)),
                SizedBox(
                  height: FetchPixels.getPixelHeight(180),
                  child: ListView.builder(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      ModelCategory modelCategory = categoryLists[index];
                      return GestureDetector(
                        onTap: () {
                          selection!.setInt("indexService", index);
                          Constant.sendToNext(
                              context, Routes.serviceDetailRoute);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: index == 0
                                  ? FetchPixels.getPixelWidth(20)
                                  : 0,
                              right: FetchPixels.getPixelWidth(20),
                              bottom: FetchPixels.getPixelHeight(28)),
                          padding: EdgeInsets.only(
                              left: FetchPixels.getPixelWidth(15),
                              right: FetchPixels.getPixelWidth(15),
                              top: FetchPixels.getPixelHeight(16),
                              bottom: FetchPixels.getPixelHeight(12)),
                          width: FetchPixels.getPixelWidth(150),
                          decoration: BoxDecoration(
                              color: backGroundColor,
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black38, BlendMode.colorBurn),
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    '${Constant.assetImagePath}${modelCategory.image}'),
                              ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(""),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomFont(modelCategory.name ?? "", 12,
                                      Colors.white, 1,
                                      fontWeight: FontWeight.w400),
                                  getVerSpace(FetchPixels.getPixelHeight(2)),
                                  modelCategory.price != null
                                      ? getCustomFont(
                                          "Desde \$${modelCategory.price}",
                                          11,
                                          Colors.white,
                                          1,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Worker')
                                      : Text(""),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                getPaddingWidget(
                  EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomFont("Barberos", 20, Colors.white70, 1,
                          fontWeight: FontWeight.w800),
                      getCustomFont("Ver todos", 14, brownColor, 1,
                          fontWeight: FontWeight.w600)
                    ],
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(1)),
                SizedBox(
                  height: FetchPixels.getPixelHeight(170),
                  // margin: EdgeInsets.only(left: FetchPixels.getPixelWidth(20)),
                  child: ListView.builder(
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: barberosList.length,
                    itemBuilder: (context, index) {
                      BarberosModel barber = barberosList[index];
                      return GestureDetector(
                        onTap: () {
                          selection?.setInt("index", index);
                          Constant.sendToNext(context, Routes.detailRoute,
                              arguments: ScreenArguments(index, barber));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? FetchPixels.getPixelWidth(5) : 0,
                          ),
                          padding: EdgeInsets.only(
                              left: FetchPixels.getPixelWidth(10),
                              right: FetchPixels.getPixelWidth(10),
                              top: FetchPixels.getPixelHeight(16),
                              bottom: FetchPixels.getPixelHeight(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: FetchPixels.getPixelWidth(15),
                            children: [
                              Hero(
                                tag: index,
                                child: CircleAvatar(
                                  radius: FetchPixels.getPixelWidth(35),
                                  backgroundImage: AssetImage(
                                      "${Constant.assetImagePath}${barber.image}"),
                                ),
                              ),
                              SizedBox(
                                width: FetchPixels.getPixelWidth(75),
                                child: getCustomFont(
                                    "${barber.nombre}", 12, Colors.white54, 2,
                                    fontWeight: FontWeight.w200,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                getPaddingWidget(
                  EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomFont(
                          "Clientes Satisfechos", 20, Colors.white70, 1,
                          fontWeight: FontWeight.w800),
                      getCustomFont("Ver todos", 14, brownColor, 1,
                          fontWeight: FontWeight.w600)
                    ],
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(5)),
                SizedBox(
                  height: FetchPixels.getPixelHeight(165),
                  // margin: EdgeInsets.only(left: FetchPixels.getPixelWidth(20)),
                  child: ListView.builder(
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: satisfechos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? FetchPixels.getPixelWidth(5) : 0,
                          ),
                          padding: EdgeInsets.only(
                              left: FetchPixels.getPixelWidth(12),
                              right: FetchPixels.getPixelWidth(10),
                              top: FetchPixels.getPixelHeight(16),
                              bottom: FetchPixels.getPixelHeight(12)),
                          width: FetchPixels.getPixelWidth(175),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${Constant.assetImagePath}${satisfechos[index]}"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
