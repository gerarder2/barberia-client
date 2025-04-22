import 'dart:convert';
import 'package:fix_store/app/view/home/widgets/expiry_date_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fix_store/app/models/creditCard_model.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';

class MyCardsScreen extends StatefulWidget {
  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  List<CreditCardModel> cards = [];

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cardList = prefs.getStringList('my_cards');
    if (cardList != null) {
      setState(() {
        cards = cardList
            .map((cardJson) => CreditCardModel.fromJson(jsonDecode(cardJson)))
            .toList();
      });
    }
  }

  Future<void> _saveCards() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cardList =
        cards.map((card) => jsonEncode(card.toJson())).toList();
    await prefs.setStringList('my_cards', cardList);
  }

  void _selectCard(int index) {
    setState(() {
      for (int i = 0; i < cards.length; i++) {
        cards[i].isSelected = i == index;
      }
    });
    _saveCards();
  }

  void _clearFormFields() {
    _cardNumberController.clear();
    _brandController.clear();
    _cardHolderController.clear();
    _expiryController.clear();
    _cvvController.clear();
  }

  void _deleteCard(int index) {
    setState(() {
      cards.removeAt(index);
    });
    _saveCards();
  }

  void _showAddCardDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: getCustomFont("Agregar nueva tarjeta", 18, Colors.white, 1,
              fontWeight: FontWeight.bold),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _cardNumberController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    maxLength: 19,
                    decoration: InputDecoration(
                      labelText: 'Número de tarjeta',
                      labelStyle: TextStyle(color: Colors.white70),
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Número de tarjeta requerido';
                      }
                      if (value.length != 16) {
                        return 'Debe tener 16 dígitos';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(12),
                  TextFormField(
                    controller: _cardHolderController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Nombre del titular',
                      labelStyle: TextStyle(color: Colors.white70),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nombre requerido';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(12),
                  TextFormField(
                    controller: _expiryController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.datetime,
                    maxLength: 5,
                    decoration: InputDecoration(
                      labelText: 'Fecha de expiración (MM/AA)',
                      labelStyle: TextStyle(color: Colors.white70),
                      hintText: 'MM/AA',
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(5),
                      ExpiryDateInputFormatter(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Fecha de expiración requerida';
                      }
                      if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$')
                          .hasMatch(value)) {
                        return 'Formato inválido (MM/AA)';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(12),
                  TextFormField(
                    controller: _cvvController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      labelStyle: TextStyle(color: Colors.white70),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'CVV requerido';
                      }
                      if (value.length != 3) {
                        return 'Debe tener 3 dígitos';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(12),
                  TextFormField(
                    controller: _brandController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Marca (VISA, MasterCard, etc.)',
                      labelStyle: TextStyle(color: Colors.white70),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Marca requerida';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: FetchPixels.getPixelHeight(50),
                child: getButton(
                  context,
                  Colors.grey.shade700,
                  "Cancelar",
                  Colors.white,
                  () {
                    _clearFormFields();
                    Navigator.of(context).pop();
                  },
                  14,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(50),
              child: getButton(
                context,
                brownColor,
                "Agregar",
                Colors.white,
                () {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      cards.add(CreditCardModel(
                        cardNumber: _cardNumberController.text,
                        brand: _brandController.text,
                        cardHolder: _cardHolderController.text,
                        expiryDate: _expiryController.text,
                        cvv: _cvvController.text,
                      ));
                    });
                    _saveCards();
                    _clearFormFields();
                    Navigator.of(context).pop();
                  }
                },
                14,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardItem(CreditCardModel card, int index) {
    return GestureDetector(
      onTap: () => _selectCard(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: getButtonDecoration(
          card.isSelected ? Colors.blue.shade900 : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: card.isSelected ? Colors.blueAccent : Colors.grey.shade700,
            width: 2,
          ),
          shadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.credit_card, size: 32, color: Colors.white),
            getHorSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomFont(
                    '**** **** **** ${card.cardNumber.substring(card.cardNumber.length - 4)}',
                    16,
                    Colors.white,
                    1,
                  ),
                  getCustomFont(card.brand, 14, Colors.white70, 1),
                  getCustomFont(
                      'Titular: ${card.cardHolder}', 14, Colors.white54, 1),
                  getCustomFont(
                      'Expira: ${card.expiryDate}', 14, Colors.white54, 1),
                ],
              ),
            ),
            if (card.isSelected) Icon(Icons.check_circle, color: Colors.green),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () => _deleteCard(index),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: whiteColor,
        elevation: 0,
        title: getCustomFont(
          "Mis Tarjetas",
          20,
          whiteColor,
          1,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cards.isEmpty
                ? Center(
                    child: getCustomFont(
                      "No tienes tarjetas guardadas",
                      16,
                      Colors.white60,
                      1,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return _buildCardItem(cards[index], index);
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: SizedBox(
              height: FetchPixels.getPixelHeight(55),
              child: getButton(
                context,
                brownColor,
                "Agregar Tarjeta",
                whiteColor,
                _showAddCardDialog,
                16,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
