import 'package:fix_store/app/data/data_file.dart';
import 'package:fix_store/app/models/model_category.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
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
      body: Container(
        width: double.infinity,
        height: FetchPixels.getHeightPercentSize(50),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "${Constant.assetImagePath}${categoryLists[index].image}"))),
        child: Text(""),
      ),
    );
  }
}
