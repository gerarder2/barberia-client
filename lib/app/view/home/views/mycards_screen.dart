import 'package:flutter/material.dart';

class MyCardsScreen extends StatefulWidget {
  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  List<String> _cards = []; // Lista de tarjetas guardadas
  final TextEditingController _cardNumberController = TextEditingController();

  void _addCard() {
    String cardNumber = _cardNumberController.text.trim();

    if (cardNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor ingresa un número de tarjeta")),
      );
      return;
    }

    setState(() {
      _cards.add(cardNumber);
    });

    _cardNumberController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Tarjeta agregada con éxito")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Tarjetas"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Volver a la pantalla anterior
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lista de tarjetas agregadas
            Expanded(
              child: ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.credit_card, color: Colors.brown),
                      title: Text(
                          "Tarjeta terminada en ${_cards[index].substring(_cards[index].length - 4)}"),
                    ),
                  );
                },
              ),
            ),
            // Formulario para agregar tarjeta
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: "Número de tarjeta",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCard,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Agregar tarjeta"),
            ),
          ],
        ),
      ),
    );
  }
}
