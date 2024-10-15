import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link,
    required this.icon,
  });
}


const List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'Riverpod Counter', 
    subTitle: 'Introduccion a Riverpod', 
    link: '/counter-river', 
    icon: Icons.add_circle_outline_rounded,
  ),
  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'Generales y controlads', 
    link: '/progress', 
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y dialogos', 
    subTitle: 'Inidicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated container', 
    subTitle: 'Stateful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'Ui Controls', 
    subTitle: 'Controles en Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Tutorial', 
    subTitle: 'Tutorial de la app', 
    link: '/tutorial', 
    icon: Icons.accessible_rounded,
  ),
  MenuItem(
    title: 'Infinite y Pull', 
    subTitle: 'Scroll infinito y pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Theme Changer', 
    subTitle: 'Cambiador de tema', 
    link: '/theme-changer', 
    icon: Icons.color_lens_rounded,
  ),
];