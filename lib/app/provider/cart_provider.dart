import 'package:fix_store/app/models/cardItem.dart';
import 'package:flutter/foundation.dart';
import 'package:fix_store/app/models/model_barberos.dart';
import 'package:fix_store/app/models/model_salon.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  final List<Map<String, dynamic>> _citas = [];

  List<Map<String, dynamic>> get citas => _citas;

  void addCita(Map<String, dynamic> cita) {
    _citas.add(cita);
    notifyListeners();
  }

  List<CartItem> get items => _items;

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + (item.producto.quantity ?? 0));
  }

  double get totalPrice {
    return _items.fold(0.0, (sum, item) {
      final qty = item.producto.quantity ?? 0;
      final price = item.producto.price ?? 0.0;
      return sum + (qty * price);
    });
  }

  void addItem(BarberosModel barbero, ModelSalon producto) {
    // 1. Aumentar en barbero.servicios
    final indexServicio =
        barbero.servicios?.indexWhere((s) => s.id == producto.id);
    if (indexServicio != null && indexServicio >= 0) {
      final servicio = barbero.servicios![indexServicio];
      servicio.quantity = (servicio.quantity ?? 0) + 1;
    }

    // 2. Buscar si ya existe ese producto + barbero en el carrito
    final indexCarrito = _items.indexWhere((item) =>
        item.producto.id == producto.id &&
        item.barbero.barberId == barbero.barberId);

    if (indexCarrito >= 0) {
      // Si ya existe, solo sumamos
      _items[indexCarrito].producto.quantity =
          (_items[indexCarrito].producto.quantity ?? 0) + 1;
    } else {
      // Si no existe, lo agregamos al carrito con quantity = 1
      final nuevoProducto = ModelSalon(
        producto.id,
        producto.image,
        producto.name,
        producto.productName,
        producto.rating,
        producto.price,
        1,
      );

      _items.add(CartItem(barbero: barbero, producto: nuevoProducto));
    }

    notifyListeners();
  }

  void decreaseItem(BarberosModel barbero, ModelSalon producto) {
    // 1. Disminuir en barbero.servicios
    final indexServicio =
        barbero.servicios?.indexWhere((s) => s.id == producto.id);
    if (indexServicio != null && indexServicio >= 0) {
      final servicio = barbero.servicios![indexServicio];
      if ((servicio.quantity ?? 0) > 0) {
        servicio.quantity = servicio.quantity! - 1;
      }
    }

    // 2. Disminuir en carrito
    final indexCarrito = _items.indexWhere((item) =>
        item.producto.id == producto.id &&
        item.barbero.barberId == barbero.barberId);

    if (indexCarrito >= 0) {
      final currentQty = _items[indexCarrito].producto.quantity ?? 0;
      if (currentQty > 1) {
        _items[indexCarrito].producto.quantity = currentQty - 1;
      } else {
        _items.removeAt(indexCarrito);
      }
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
