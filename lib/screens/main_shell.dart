import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'home_page.dart';
import 'vendor_page.dart';
import 'surat_page.dart';
import 'kua_page.dart';
import 'profil_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _titles = ['Beranda', 'Vendor', 'Surat', 'Lokasi KUA', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _index == 0
          ? null
          : AppBar(
              title: Text(_titles[_index]),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
      body: IndexedStack(
        index: _index,
        children: const [
          HomePage(),
          VendorPage(),
          SuratPage(),
          KuaPage(),
          ProfilPage(),
        ],
      ),
      bottomNavigationBar: BottomNav(
        current: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final int current;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.current, required this.onTap});

  static const _items = [
    [Icons.home_filled, 'Home'],
    [Icons.storefront, 'Vendor'],
    [Icons.mail, 'Surat'],
    [Icons.location_on, 'KUA'],
    [Icons.person, 'Profil'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(_items.length, (i) {
              final icon = _items[i][0] as IconData;
              final label = _items[i][1] as String;
              final active = i == current;
              final color = active ? AppColors.primary : Colors.grey;
              final isCenter = i == 2;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 4),
                    child: Column(
                      mainAxisAlignment: isCenter
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isCenter)
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.4,
                                  ),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(icon, color: Colors.white, size: 26),
                          )
                        else
                          Icon(icon, color: color, size: 26),
                        const SizedBox(height: 4),
                        Text(
                          label,
                          style: TextStyle(fontSize: 12, color: color),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
