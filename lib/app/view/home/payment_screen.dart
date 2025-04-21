import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/base/constant.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = "";

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
    if (method == "Tarjeta") {
      // Navegar a la pantalla de tarjetas cuando se selecciona "Tarjeta"
      Constant.sendToNext(context, Routes.mycardsRoute);
    }
  }

  void _confirmPayment() {
    if (_selectedPaymentMethod.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor selecciona un método de pago")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pago confirmado con $_selectedPaymentMethod")),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required IconData icon,
    required String method,
  }) {
    final isSelected = _selectedPaymentMethod == method;

    return InkWell(
      onTap: () => _selectPaymentMethod(method),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.brown : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.brown),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Método de pago"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaymentOption(
              title: "PayPal",
              icon: Icons.account_balance_wallet,
              method: "PayPal",
            ),
            _buildPaymentOption(
              title: "Tarjeta de crédito / débito",
              icon: Icons.credit_card,
              method: "Tarjeta",
            ),
            _buildPaymentOption(
              title: "Efectivo en establecimiento",
              icon: Icons.store,
              method: "Efectivo",
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _confirmPayment,
                child: Text(
                  "Confirmar pago",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
