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
  DateTime? _selectedTimeSlot;

  // Generar horarios desde 9:00 AM a 8:00 PM con intervalos de 45 minutos
  List<DateTime> generarHorariosDelDia(DateTime dia) {
    final horaInicio = DateTime(dia.year, dia.month, dia.day, 9, 0);
    final horaFin = DateTime(dia.year, dia.month, dia.day, 20, 0);
    final intervaloMinutos = 45;

    List<DateTime> horarios = [];
    DateTime actual = horaInicio;
    while (actual.isBefore(horaFin)) {
      horarios.add(actual);
      actual = actual.add(Duration(minutes: intervaloMinutos));
    }
    return horarios;
  }

  // Formatear hora a "hh:mm AM/PM"
  String formatearHora(DateTime hora) {
    final horas = hora.hour > 12 ? hora.hour - 12 : hora.hour;
    final minutos = hora.minute.toString().padLeft(2, '0');
    final sufijo = hora.hour >= 12 ? 'PM' : 'AM';
    return "$horas:$minutos $sufijo";
  }

  @override
  Widget build(BuildContext context) {
    final horarios = generarHorariosDelDia(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: whiteColor,
        backgroundColor: backGroundColor,
        title: getCustomFont('Selecciona tu día', 16, whiteColor, 1),
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                  _selectedTimeSlot = null; // Limpiar selección anterior
                });
              },
              enabledDayPredicate: (day) {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                final checkDay = DateTime(day.year, day.month, day.day);
                return !checkDay.isBefore(today);
              },
              headerStyle: HeaderStyle(
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonVisible: false,
                leftChevronIcon:
                    const Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    const Icon(Icons.chevron_right, color: Colors.white),
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: const TextStyle(color: Colors.white),
                defaultTextStyle: const TextStyle(color: Colors.white),
                disabledTextStyle: const TextStyle(color: Colors.grey),
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
            const SizedBox(height: 24),
            getCustomFont("Selecciona un horario", 16, whiteColor, 1),
            const SizedBox(height: 12),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.spaceBetween,
                children: horarios.map((hora) {
                  bool estaSeleccionado = _selectedTimeSlot == hora;
                  return ChoiceChip(
                    label: Text(
                      formatearHora(hora),
                      style: TextStyle(
                        color: estaSeleccionado ? Colors.white : Colors.white,
                      ),
                    ),
                    selected: estaSeleccionado,
                    onSelected: (_) {
                      setState(() {
                        _selectedTimeSlot = hora;
                      });
                    },
                    selectedColor: brownColor,
                    backgroundColor: backGroudAux,
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 45),
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
                  if (_selectedTimeSlot != null) {
                    // Aquí podrías pasar la hora seleccionada a la siguiente pantalla
                    Constant.sendToNext(context, Routes.paymentRoute);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text("Selecciona un horario antes de continuar")),
                    );
                  }
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
