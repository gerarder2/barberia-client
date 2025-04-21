import 'package:fix_store/app/models/model_barberos.dart';
import 'package:fix_store/app/models/model_salon.dart';

class CartItem {
  final BarberosModel barbero;
  final ModelSalon producto;

  CartItem({required this.barbero, required this.producto});
}
