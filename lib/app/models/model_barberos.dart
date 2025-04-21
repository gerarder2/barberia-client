import 'package:fix_store/app/models/model_salon.dart';

class BarberosModel {
  int? barberId;
  String? nombre;
  String? image;
  String? rating;
  String? description;
  List<ModelSalon>? servicios;

  BarberosModel(this.barberId, this.servicios, this.nombre, this.image,
      this.rating, this.description);
}
