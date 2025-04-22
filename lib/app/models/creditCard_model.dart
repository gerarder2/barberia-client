class CreditCardModel {
  String cardNumber;
  String brand;
  String cardHolder;
  String expiryDate;
  String cvv;
  bool isSelected;

  CreditCardModel({
    required this.cardNumber,
    required this.brand,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
    this.isSelected = false,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      cardNumber: json['cardNumber'],
      brand: json['brand'],
      cardHolder: json['cardHolder'],
      expiryDate: json['expiryDate'],
      cvv: json['cvv'],
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'brand': brand,
      'cardHolder': cardHolder,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'isSelected': isSelected,
    };
  }
}
