class Vendor {
  final String name;
  final String category;
  final int price;
  final double rating;

  const Vendor(this.name, this.category, this.price, this.rating);
}

const List<Vendor> kVendors = [
  Vendor('Berkah Catering', 'Katering', 45000000, 4.8),
  Vendor('Dapur Nusantara', 'Katering', 38000000, 4.6),
  Vendor('Melati Decor', 'Dekorasi', 25000000, 4.7),
  Vendor('Pelaminan Anggun', 'Dekorasi', 18000000, 4.5),
  Vendor('Ayu Bridal', 'Busana & Rias', 12000000, 4.9),
  Vendor('Sakinah Rias', 'Busana & Rias', 9000000, 4.4),
  Vendor('Momen Abadi Studio', 'Foto & Video', 15000000, 4.8),
  Vendor('Lensa Cinta', 'Foto & Video', 11000000, 4.6),
];
