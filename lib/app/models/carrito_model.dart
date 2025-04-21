import 'package:fix_store/app/models/model_salon.dart';

class CarritoModel {
  int? barberId;
  String? barberName;
  List<ModelSalon>? serviciosAgregados;

  CarritoModel({this.barberId, this.barberName, this.serviciosAgregados});
}
