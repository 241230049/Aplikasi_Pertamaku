import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'sub_page.dart';
import 'placeholder_page.dart';
import 'vendor_page.dart';
import 'kua_page.dart';
import 'surat_page.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color color;
  final bool isNew;
  final WidgetBuilder page;

  MenuItem(this.title, this.icon, this.color, this.page, {this.isNew = false});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<MenuItem> _menus() => [
    MenuItem(
      'Surat Pengantar RT/RW',
      Icons.description,
      Colors.teal,
      (c) => const SubPage(title: 'Surat Menyurat', child: SuratPage()),
      isNew: true,
    ),
    MenuItem(
      'Formulir Model N',
      Icons.assignment,
      Colors.indigo,
      (c) => const PlaceholderPage(
        title: 'Formulir Model N',
        icon: Icons.assignment,
        description: 'Isi formulir N1-N4 secara digital, lalu cetak atau kirim langsung ke KUA.',
      ),
    ),
    MenuItem(
      'Izin Wali / Orang Tua',
      Icons.family_restroom,
      Colors.orange,
      (c) => const PlaceholderPage(
        title: 'Izin Wali / Orang Tua',
        icon: Icons.family_restroom,
        description:
            'Buat surat izin dari wali atau orang tua calon pengantin.',
      ),
    ),
    MenuItem(
      'Rekomendasi Nikah',
      Icons.verified,
      Colors.green,
      (c) => const PlaceholderPage(
        title: 'Rekomendasi Nikah',
        icon: Icons.verified,
        description:
            'Ajukan surat rekomendasi nikah bila menikah di luar domisili.',
      ),
    ),
    MenuItem(
      'Lokasi KUA',
      Icons.location_on,
      Colors.red,
      (c) => const SubPage(title: 'Lokasi KUA', child: KuaPage()),
    ),
    MenuItem(
      'Antrean KUA',
      Icons.confirmation_number,
      Colors.blue,
      (c) => const SubPage(title: 'Antrean KUA', child: KuaPage()),
    ),
    MenuItem(
      'Vendor Pernikahan',
      Icons.storefront,
      AppColors.primary,
      (c) => const SubPage(title: 'Vendor', child: VendorPage()),
      isNew: true,
    ),
    MenuItem(
      'Katering',
      Icons.restaurant,
      Colors.deepOrange,
      (c) => const SubPage(
        title: 'Katering',
        child: VendorPage(initialCategory: 'Katering'),
      ),
    ),
    MenuItem(
      'Dekorasi',
      Icons.celebration,
      Colors.purple,
      (c) => const SubPage(
        title: 'Dekorasi',
        child: VendorPage(initialCategory: 'Dekorasi'),
      ),
    ),
    MenuItem(
      'Busana & Rias',
      Icons.checkroom,
      Colors.pink,
      (c) => const SubPage(
        title: 'Busana & Rias',
        child: VendorPage(initialCategory: 'Busana & Rias'),
      ),
    ),
    MenuItem(
      'Foto & Video',
      Icons.photo_camera,
      Colors.cyan,
      (c) => const SubPage(
        title: 'Foto & Video',
        child: VendorPage(initialCategory: 'Foto & Video'),
      ),
    ),
    MenuItem(
      'Menu Lainnya',
      Icons.apps,
      Colors.teal,
      (c) => const PlaceholderPage(
        title: 'Menu Lainnya',
        icon: Icons.apps,
        description: 'Fitur lain seperti checklist persiapan, budget, dan undangan digital akan hadir di sini.',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final menus = _menus();

    return SingleChildScrollView(
      child: Column(
        children: [
          _header(context),
          _greeting(),
          _infoCard(context),
          _banner(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.78,
              children: menus.map((m) => _menuTile(context, m)).toList(),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        MediaQuery.of(context).padding.top + 12,
        16,
        16,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.white, size: 22),
                Text(
                  'NikahKu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'Cari vendor, KUA, surat...',
                      ),
                      onSubmitted: (q) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SubPage(
                            title: 'Hasil: $q',
                            child: VendorPage(initialQuery: q),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.notifications_none),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.soft,
                    child: Icon(Icons.person, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _greeting() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, INDOKO',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                  ],
                ),
                Text(
                  'Persiapan pernikahan Anda berjalan (Aktif)',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text('v1.0.0', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _infoCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Anda memiliki dokumen yang belum lengkap :'),
                Text(
                  '3 dari 8 berkas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info, color: Colors.blue),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Berkas belum lengkap'),
                content: const Text(
                  'Lengkapi berkas di menu Surat sebelum mendaftar nikah ke KUA.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Tutup'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.soft,
              shape: BoxShape.circle,
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.favorite, color: AppColors.primary, size: 54),
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: Icon(Icons.diamond, color: Colors.amber, size: 28),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Antrean KUA Online',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Daftar nikah lebih efisien tanpa harus menunggu lama.',
                  style: TextStyle(color: Colors.black87),
                ),
                const Divider(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SubPage(
                          title: 'Antrean KUA',
                          child: KuaPage(),
                        ),
                      ),
                    ),
                    child: const Text('Ambil Antrean'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuTile(BuildContext context, MenuItem m) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: m.page)),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: m.color.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(m.icon, color: m.color, size: 28),
                ),
                if (m.isNew)
                  Positioned(
                    right: -8,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Baru',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              m.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
    ],
  );
}
