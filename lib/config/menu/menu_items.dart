import 'package:flutter/material.dart' show Icons, IconData;

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.perm_device_information_sharp,
  ),
  MenuItem(
    title: 'Infinite scroll y pull',
    subtitle: 'Indicadores en pantalla',
    link: '/infinite',
    icon: Icons.list,
  ),
  MenuItem(
    title: 'Animated container',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.animation,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Una serie de controles de Flutter',
    link: '/controls',
    icon: Icons.car_rental,
  ),
  MenuItem(
    title: 'Inducción a la aplicación',
    subtitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.wheelchair_pickup_sharp,
  ),
  MenuItem(
    title: 'Test',
    subtitle: 'Campo de pruebas de widgets',
    link: '/test',
    icon: Icons.science_outlined,
  )
];
