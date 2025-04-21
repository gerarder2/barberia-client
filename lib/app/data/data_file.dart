import 'package:fix_store/app/models/model_address.dart';
import 'package:fix_store/app/models/model_barberos.dart';
import 'package:fix_store/app/models/model_booking.dart';
import 'package:fix_store/app/models/model_card.dart';
import 'package:fix_store/app/models/model_cart.dart';
import 'package:fix_store/app/models/model_category.dart';
import 'package:fix_store/app/models/model_color.dart';
import 'package:fix_store/app/models/model_country.dart';
import 'package:fix_store/app/models/model_intro.dart';
import 'package:fix_store/app/models/model_notification.dart';
import 'package:fix_store/app/models/model_other.dart';
import 'package:fix_store/app/models/model_popular_service.dart';
import 'package:fix_store/app/models/model_salon.dart';

import '../../base/color_data.dart';

class DataFile {
  static List<ModelIntro> introList = [
    ModelIntro(
        1,
        "Best Services For Your Home ",
        "Homecare is health care provided by a professional caregiver in the individual home.",
        "intro1.png",
        intro1Color),
    ModelIntro(
        2,
        "Care Your Home With Us",
        "Some nurses travel to multiple homes per day and provide short visits to multiple patients.",
        "intro2.png",
        intro2Color),
    ModelIntro(
        3,
        "Using Smart Gadgets ",
        "Homecare is also known as domiciliary care, social care or in-home care.",
        "intro3.png",
        intro3Color),
  ];

  static List<ModelCountry> countryList = [
    ModelCountry("image_fghanistan.jpg", "Afghanistan (AF)", "+93"),
    ModelCountry("image_ax.jpg", "Aland Islands (AX)", "+358"),
    ModelCountry("image_albania.jpg", "Albania (AL)", "+355"),
    ModelCountry("image_andora.jpg", "Andorra (AD)", "+376"),
    ModelCountry("image_islands.jpg", "Aland Islands (AX)", "+244"),
    ModelCountry("image_angulia.jpg", "Anguilla (AL)", "+1"),
    ModelCountry("image_armenia.jpg", "Armenia (AN)", "+374"),
    ModelCountry("image_austia.jpg", "Austria (AT)", "+372"),
  ];
  static List<ModelCategory> categoryList = [
    ModelCategory("tinte.jpg", "Corte avanzado", "100",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Barba", "150",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Tinte", "180",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Despunte", "200",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Corte sencillo", "80",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Lavado", "50",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Diseños", "100",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Facial", "120",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Cabello y barba", "100",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Health", "100",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Cooking Shef", "115",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Plumbing", "300",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Transport", "500",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("barber-intro.jpg", "Gardening", "250",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ModelCategory("tinte.jpg", "Trashing", "100",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  ];

  static List<ModelSalon> salonProductList = [
    ModelSalon(1, "hair1.png", "Haircut", "Men’s Haircut", "4.5", 10.00, 0),
    ModelSalon(
        2, "shaving.png", "Shaving", "Men’s Beard Shave", "4.4", 8.00, 0),
    ModelSalon(
        3, "facecare.png", "Face Care", "Men’s Face Care", "4.4", 12.00, 0),
    ModelSalon(
        4, "haircolor.png", "Hair Color", "Men’s Hair Color", "4.4", 8.00, 0),
  ];

  static List<ModelColor> hairColorList = [
    ModelColor("blackhair.png", "Black", "Black Hair Color", "4.5", 6.00, 0),
    ModelColor("brownhair.png", "Brown", "Brown Hair Color", "4.5", 10.00, 0),
  ];

  static Map<String, ModelCart> cartList = {};

  static List<ModelOther> otherProductList = [
    ModelOther("beard_shape.png", "Beard Shaping", 13.00, 0),
    ModelOther("head_massage.png", "Head Massage", 16.00, 0),
  ];

  static List<String> timeList = [
    "06:00 AM",
    "08:00 AM",
    "10:00 AM",
    "12:00 PM",
    "13:00 PM",
    "14:00 PM",
    "16:00 PM",
    "18:00 PM",
    "19:00 PM",
    "20:00 PM",
    "21:00 PM"
  ];

  static List<ModelCard> cardList = [
    ModelCard("paypal.svg", "Paypal", "xxxx xxxx xxxx 5416"),
    ModelCard("mastercard.svg", "Master Card", "xxxx xxxx xxxx 8624"),
    ModelCard("visa.svg", "Visa", "xxxx xxxx xxxx 4565")
  ];

  static List<ModelBooking> bookingList = [
    ModelBooking("booking1.png", "Cleaning", "23 April, 2022, 11:00 am", "4.3",
        20.00, "By Mendy Wilson", "Active", 0xFFEEFCF0, success),
    ModelBooking("booking2.png", "Painting", "22 April, 2022, 08:00 am", "4.2",
        50.00, "By Jenny Winget", "Completed", 0xFFF0F8FF, completed),
    ModelBooking("booking3.png", "Cleaning", "20 April, 2022, 06:00 pm", "4.3",
        18.00, "By Jacob Jones", "Cancelled", 0xFFFFF3F3, error),
    ModelBooking("booking4.png", "Repairing", "20 April, 2022, 06:00 pm", "4.3",
        18.00, "By Jacob Jones", "Completed", 0xFFF0F8FF, completed),
  ];

  static List<ModelAddress> addressList = [
    ModelAddress("Alena Gomez",
        "3891 Ranchview Dr. Richardson, California 62639", "(907) 555-0101"),
    ModelAddress("Alena Gomez", "4140 Parker Rd. Allentown, New Mexico 31134",
        "(907) 555-0101"),
  ];

  static List<ModelNotification> notificationList = [
    ModelNotification(
        "Lorem ipsum dolor",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus congue rutrum. Morbi malesuada eleifend eros vel malesuada. Duis sed molestie purus.",
        "1 h ago",
        "Today"),
    ModelNotification(
        "Lorem ipsum dolor",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus congue rutrum. Morbi malesuada eleifend eros vel malesuada. Duis sed molestie purus.",
        "1 h ago",
        "Today"),
    ModelNotification(
        "Lorem ipsum dolor",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus congue rutrum. Morbi malesuada eleifend eros vel malesuada. Duis sed molestie purus.",
        "03:00 pm",
        "Yesterday"),
    ModelNotification(
        "Lorem ipsum dolor",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed maximus congue rutrum. Morbi malesuada eleifend eros vel malesuada. Duis sed molestie purus.",
        "01:00 pm",
        "Yesterday"),
  ];

  static List<String> searchList = [];

  static List<String> popularSearchList = [
    "cleaning",
    "washing",
    "painting",
    "salon",
    "health",
    "transport",
    "gardening",
    "beauty",
    "trashing",
    "plumbing"
  ];

  static List<ModelPopularService> popularServiceList = [
    ModelPopularService("wallpaper.png", "Wall Painting", "Painter"),
    ModelPopularService("barber.png", "Salon For Men", "Barber"),
    ModelPopularService("wallpaper.png", "Wall Painting", "Painter"),
    ModelPopularService("barber.png", "Salon For Men", "Barber"),
  ];

  static List<BarberosModel> barberList = [
    BarberosModel(
        1,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Juan Perez",
        "barberPerfil.jpg",
        "4.3",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        2,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Gerardo Zazueta",
        "barberPerfil2.jpg",
        "4.8",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        3,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "David Aviles",
        "barberPerfil.jpg",
        "5",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        4,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Desire Lopez",
        "barberPerfil2.jpg",
        "4.0",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        5,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Cesar Perez",
        "barberPerfil.jpg",
        "4.2",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        6,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Miguel Monarrez",
        "barberPerfil2.jpg",
        "4.7",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        7,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Pedrito Sola",
        "barberPerfil.jpg",
        "4.6",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    BarberosModel(
        8,
        salonProductList.map((servicio) => servicio.copy()).toList(),
        "Pepe Garza",
        "barberPerfil2.jpg",
        "4.6",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  ];
}
