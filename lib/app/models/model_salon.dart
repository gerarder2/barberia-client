class ModelSalon {
  int? id;
  String? image;
  String? name;
  String? productName;
  String? rating;
  double? price;
  int? quantity;

  ModelSalon(this.id, this.image, this.name, this.productName, this.rating,
      this.price, this.quantity);

  ModelSalon copy() {
    return ModelSalon(
      id,
      image,
      name,
      productName,
      rating,
      price,
      0, // quantity reseteado para evitar compartir estado
    );
  }
}
