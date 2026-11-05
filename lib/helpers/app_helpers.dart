import 'package:flutter/material.dart';

String rupiah(int v) {
  final s = v.toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write('.');
    b.write(s[i]);
  }
  return 'Rp $b';
}

IconData categoryIcon(String c) {
  switch (c) {
    case 'Katering':
      return Icons.restaurant;
    case 'Dekorasi':
      return Icons.celebration;
    case 'Busana & Rias':
      return Icons.checkroom;
    case 'Foto & Video':
      return Icons.photo_camera;
    default:
      return Icons.storefront;
  }
}
