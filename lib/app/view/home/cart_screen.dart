import 'package:fix_store/app/provider/cart_provider.dart';
import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items;

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        foregroundColor: whiteColor,
        title: getCustomFont("Orden de servicios", 16, whiteColor, 1),
      ),
      body: cartItems.isEmpty
          ? Center(
              child:
                  getCustomFont('No haz agregado servicios', 16, textColor, 1),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (_, index) {
                      final item = cartItems[index];
                      final producto = item.producto;
                      final barbero = item.barbero;

                      return Card(
                        color: backGroudAux,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/${producto.image}",
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title:
                              getCustomFont(producto.name!, 16, whiteColor, 4),
                          subtitle: getCustomFont(
                              'Barbero: ${barbero.nombre}\n\$${producto.price!.toStringAsFixed(2)}',
                              12,
                              whiteColor,
                              fontWeight: FontWeight.w200,
                              4),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              getCustomFont(
                                  '${producto.quantity}', 12, whiteColor, 1),
                              IconButton(
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: whiteColor,
                                ),
                                onPressed: () {
                                  cart.decreaseItem(barbero, producto);
                                },
                              ),
                              // IconButton(
                              //   icon: Icon(
                              //     Icons.add_circle_outline,
                              //     color: whiteColor,
                              //   ),
                              //   onPressed: () {
                              //     // cart.addItem(barbero, producto);
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont('Total: ', 14, whiteColor, 1),
                          getCustomFont(
                              '\$${cart.totalPrice.toStringAsFixed(2)}',
                              16,
                              whiteColor,
                              1)
                        ],
                      ),
                      SizedBox(height: FetchPixels.getPixelHeight(20)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          color: brownColor,
                          height: FetchPixels.getPixelHeight(60),
                          child: getButton(
                              context, brownColor, "Continuar", whiteColor, () {
                            Constant.sendToNext(context, Routes.calendarRoute);
                          }, 16),
                        ),
                      ),
                      SizedBox(height: FetchPixels.getPixelHeight(20)),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
