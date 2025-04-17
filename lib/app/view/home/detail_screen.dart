import 'package:fix_store/app/data/data_file.dart';
import 'package:fix_store/app/models/model_barberos.dart';
import 'package:fix_store/app/models/model_cart.dart';
import 'package:fix_store/app/models/model_salon.dart';
import 'package:fix_store/app/routes/app_pages.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../models/model_popular_service.dart';
import '../dialog/color_dialog.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, int? index}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<ModelSalon> salonProductLists = DataFile.salonProductList;
  List<ModelPopularService> popularServiceLists = DataFile.popularServiceList;

  SharedPreferences? selection;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      setState(() {
        selection = sp;
      });
    });
  }

  var total = 0.00;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
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
                      title: "Detail",
                      weight: FontWeight.w800,
                      textColor: Colors.white60,
                      fontsize: 24,
                      istext: true,
                      isrightimage: true,
                      rightimage: "more.svg",
                      rightFunction: () {}),
                ),
                getVerSpace(FetchPixels.getPixelHeight(20)),
                Expanded(
                    flex: 1,
                    child: ListView(
                      primary: true,
                      shrinkWrap: true,
                      children: [
                        getPaddingWidget(
                            EdgeInsets.symmetric(
                                horizontal: FetchPixels.getPixelWidth(20)),
                            productImage(args.barbero, args.index)),
                        getVerSpace(FetchPixels.getPixelHeight(20)),
                        getPaddingWidget(
                          EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(20)),
                          getCustomFont(
                              "${args.barbero.nombre}", 24, Colors.white60, 1,
                              fontWeight: FontWeight.w800),
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(17)),
                        getPaddingWidget(
                          EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  getSvgImage("star.svg",
                                      width: FetchPixels.getPixelHeight(25),
                                      height: FetchPixels.getPixelHeight(25)),
                                  getHorSpace(FetchPixels.getPixelWidth(10)),
                                  getCustomFont("4.5", 16, textColor, 1,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ],
                          ),
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(24)),
                        getPaddingWidget(
                          EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(20)),
                          getMultilineCustomFont(
                              "There is a distinction between a beauty salon and a hair salon and although many small treatments, beauty salons provide extended services related to skin health.",
                              16,
                              textColor,
                              fontWeight: FontWeight.w200,
                              txtHeight: FetchPixels.getPixelHeight(1.3)),
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(29)),
                        getPaddingWidget(
                          EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(20)),
                          getCustomFont("Packages", 16, textColor, 1,
                              fontWeight: FontWeight.w800),
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(15)),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: salonProductLists.length,
                          itemBuilder: (context, index) {
                            ModelSalon modelSalon = salonProductLists[index];
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: FetchPixels.getPixelHeight(20),
                                  left: FetchPixels.getPixelWidth(20),
                                  right: FetchPixels.getPixelWidth(20)),
                              width: FetchPixels.getPixelWidth(374),
                              padding: EdgeInsets.only(
                                  left: FetchPixels.getPixelWidth(16),
                                  right: FetchPixels.getPixelWidth(16),
                                  top: FetchPixels.getPixelHeight(16),
                                  bottom: FetchPixels.getPixelHeight(16)),
                              decoration: BoxDecoration(
                                  color: backGroudAux,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white12,
                                        blurRadius: 10,
                                        offset: Offset(0.0, 4.0)),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      FetchPixels.getPixelHeight(12))),
                              child: Row(
                                children: [
                                  packageImage(context, modelSalon),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: FetchPixels.getPixelWidth(16)),
                                      child: packageDescription(modelSalon),
                                    ),
                                  ),
                                  addButton(modelSalon, context, index)
                                ],
                              ),
                            );
                          },
                        ),
                        getVerSpace(FetchPixels.getPixelHeight(10)),
                        total == 0.00
                            ? Container()
                            : getPaddingWidget(
                                EdgeInsets.symmetric(
                                    horizontal: FetchPixels.getPixelWidth(20)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getCustomFont("Total", 24, Colors.black, 1,
                                        fontWeight: FontWeight.w800),
                                    getCustomFont(
                                        "\$$total", 24, Colors.black, 1,
                                        fontWeight: FontWeight.w800)
                                  ],
                                ),
                              ),
                        total == 0.00
                            ? Container()
                            : getVerSpace(FetchPixels.getPixelHeight(30)),
                        getPaddingWidget(
                            EdgeInsets.symmetric(
                                horizontal: FetchPixels.getPixelWidth(20)),
                            viewCartButton(context)),
                        getVerSpace(FetchPixels.getPixelHeight(30))
                      ],
                    ))
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Constant.backToPrev(context);
          return false;
        });
  }

  Widget viewCartButton(BuildContext context) {
    return getButton(context, brownColor, "View Cart", Colors.white, () {
      showModalBottomSheet(
          backgroundColor: backGroundColor,
          isDismissible: false,
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(FetchPixels.getPixelHeight(40)),
            ),
          ),
          builder: (context) {
            return const ColorDialog();
          });
    }, 18,
        weight: FontWeight.w600,
        buttonHeight: FetchPixels.getPixelHeight(60),
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(14)));
  }

  Column addButton(ModelSalon modelSalon, BuildContext context, int index) {
    return Column(
      children: [
        if (modelSalon.quantity == 0)
          getButton(context, Colors.transparent, "Add", brownColor, () {
            modelSalon.quantity = (modelSalon.quantity! + 1);
            total = total + (modelSalon.price! * 1);
            DataFile.cartList[index.toString()] = ModelCart(
                modelSalon.image,
                modelSalon.name,
                modelSalon.productName,
                modelSalon.rating,
                modelSalon.price,
                modelSalon.quantity);

            setState(() {});
          }, 14,
              weight: FontWeight.w600,
              insetsGeometrypadding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getPixelWidth(20),
                  vertical: FetchPixels.getPixelHeight(12)),
              borderColor: brownColor,
              borderWidth: 1.5,
              isBorder: true,
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(10)))
        else
          Row(
            children: [
              GestureDetector(
                child: getSvgImage("add1.svg",
                    width: FetchPixels.getPixelHeight(30),
                    height: FetchPixels.getPixelHeight(30)),
                onTap: () {
                  modelSalon.quantity = (modelSalon.quantity! + 1);
                  total = total + (modelSalon.price! * 1);

                  DataFile.cartList[index.toString()]!.quantity =
                      modelSalon.quantity;

                  setState(() {});
                },
              ),
              getHorSpace(FetchPixels.getPixelWidth(10)),
              getCustomFont(modelSalon.quantity.toString(), 14, Colors.black, 1,
                  fontWeight: FontWeight.w400),
              getHorSpace(FetchPixels.getPixelWidth(10)),
              GestureDetector(
                child: getSvgImage("minus.svg",
                    width: FetchPixels.getPixelHeight(30),
                    height: FetchPixels.getPixelHeight(30)),
                onTap: () {
                  modelSalon.quantity = (modelSalon.quantity! - 1);
                  total = total - (modelSalon.price! * 1);

                  if (modelSalon.quantity! > 0) {
                    DataFile.cartList[index.toString()]!.quantity =
                        modelSalon.quantity;
                  } else {
                    DataFile.cartList.remove(index.toString());
                  }

                  setState(() {});
                },
              ),
            ],
          ),
        getVerSpace(FetchPixels.getPixelHeight(40)),
        getCustomFont("\$${modelSalon.price}", 16, brownColor, 1,
            fontWeight: FontWeight.w800)
      ],
      crossAxisAlignment: CrossAxisAlignment.end,
    );
  }

  Column packageDescription(ModelSalon modelSalon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getCustomFont(modelSalon.name ?? '', 16, textColor, 1,
            fontWeight: FontWeight.w800),
        getVerSpace(FetchPixels.getPixelHeight(4)),
        getCustomFont(modelSalon.productName ?? "", 14, textColor, 1,
            fontWeight: FontWeight.w400),
        getVerSpace(FetchPixels.getPixelHeight(6)),
        Row(
          children: [
            getSvgImage("star.svg",
                height: FetchPixels.getPixelHeight(16),
                width: FetchPixels.getPixelHeight(16)),
            getHorSpace(FetchPixels.getPixelWidth(6)),
            getCustomFont(modelSalon.rating ?? "", 14, textColor, 1,
                fontWeight: FontWeight.w400)
          ],
        )
      ],
    );
  }

  Container packageImage(BuildContext context, ModelSalon modelSalon) {
    return Container(
      height: FetchPixels.getPixelHeight(104),
      width: FetchPixels.getPixelHeight(104),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
          color: listColor,
          image: getDecorationAssetImage(context, modelSalon.image ?? "")),
    );
  }

  Hero productImage(BarberosModel barbero, int index) {
    return Hero(
      tag: index,
      child: getAssetImage(barbero.image ?? "", FetchPixels.getPixelWidth(374),
          FetchPixels.getPixelHeight(225),
          boxFit: BoxFit.fill),
    );
  }
}

class ScreenArguments {
  final int index;
  final BarberosModel barbero;

  ScreenArguments(this.index, this.barbero);
}
