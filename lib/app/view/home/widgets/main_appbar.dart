import 'package:fix_store/base/color_data.dart';
import 'package:flutter/material.dart';

class MainAppbar extends StatefulWidget {
  const MainAppbar({super.key});

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  final List<String> notifications = [
    'Notificación 1',
    'Notificación 2',
    'Notificación 3',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: Row(
        children: [
          // Avatar de usuario
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
                "assets/images/mainProfile.jpg"), // Reemplaza con la URL de la imagen del usuario
          ),
          SizedBox(width: 10),
          // Texto de bienvenida y nombre
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bienvenido',
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.bold)),
              Text('Juan Pérez',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ],
      ),
      actions: [
        // Icono de notificación
        CircleAvatar(
          backgroundColor: backGroundColor,
          radius: 25,
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // Muestra las notificaciones al presionar el icono
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Notificaciones'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: notifications
                            .map((notification) => Text(notification))
                            .toList(),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
