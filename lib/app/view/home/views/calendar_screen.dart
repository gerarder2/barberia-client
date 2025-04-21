import 'package:fix_store/app/routes/app_routes.dart';
import 'package:fix_store/base/color_data.dart';
import 'package:fix_store/base/constant.dart';
import 'package:fix_store/base/resizer/fetch_pixels.dart';
import 'package:fix_store/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: whiteColor,
        backgroundColor: backGroundColor,
        title: getCustomFont('Selecciona tu día', 16, whiteColor, 1),
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              enabledDayPredicate: (day) {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                final checkDay = DateTime(day.year, day.month, day.day);
                return !checkDay.isBefore(today);
              },
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonVisible: false,
                leftChevronIcon: Icon(Icons.chevron_left, color: whiteColor),
                rightChevronIcon: Icon(Icons.chevron_right, color: whiteColor),
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(color: whiteColor),
                defaultTextStyle: TextStyle(color: whiteColor),
                disabledTextStyle: TextStyle(color: Colors.grey),
                todayDecoration: BoxDecoration(
                  color: brownColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: textColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Si quieres agregar más contenido aquí como citasHoy, lo puedes hacer
          ],
        ),
      ),

      // Este es el botón centrado al final
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
            16, 0, 16, 45), // espacio lateral e inferior
        child: SizedBox(
          height: FetchPixels.getPixelHeight(55),
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: brownColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: getButton(
                context,
                Colors.transparent,
                "Continuar",
                whiteColor,
                () {
                  Constant.sendToNext(context, Routes.paymentRoute);
                },
                16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
