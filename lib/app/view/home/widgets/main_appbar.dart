import 'package:fix_store/app/provider/cart_provider.dart';
import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppbar extends StatefulWidget {
  const MainAppbar({super.key});

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  final List<String> notifications = [
    'Notificación 1',
    'Notificación 2',
    'Notificación 3',
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: Row(
        children: [
          // Avatar de usuario
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/mainProfile.jpg"),
          ),
          SizedBox(width: 10),
          // Nombre con control de overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                getCustomFont("Bienvenido", 16, textColor, 1,
                    fontWeight: FontWeight.bold),
                getCustomFont(
                  "Gerardo Zazueta Corral", // Este nombre se truncará con "..."
                  16,
                  whiteColor,
                  1,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // Icono del carrito con contador
        Padding(
          padding: EdgeInsets.only(right: FetchPixels.getPixelWidth(10)),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: backGroundColor,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: whiteColor,
                  onPressed: () {
                    Constant.sendToNext(context, Routes.cartRoute);
                  },
                ),
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: GestureDetector(
                    onTap: () => Constant.sendToNext(context, Routes.cartRoute),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        '${cart.itemCount}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        // Icono de notificaciones
        Padding(
          padding: EdgeInsets.only(right: FetchPixels.getPixelWidth(10)),
          child: CircleAvatar(
            backgroundColor: backGroundColor,
            radius: 25,
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: whiteColor,
              ),
              onPressed: () {
                // Mostrar popup de notificaciones
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: getCustomFont(
                        'Notificaciones',
                        18,
                        whiteColor,
                        1,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.black87,
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: notifications
                              .map((notification) => getCustomFont(
                                    notification,
                                    14,
                                    whiteColor,
                                    2,
                                  ))
                              .toList(),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: getCustomFont(
                            'Cerrar',
                            14,
                            whiteColor,
                            1,
                            fontWeight: FontWeight.w500,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
