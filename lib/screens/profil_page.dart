import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.soft,
            child: Icon(Icons.person, size: 50, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          const Text(
            'INDOKO',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'dharma@nikahku.app',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.favorite, color: AppColors.primary),
                  title: const Text('Pasangan'),
                  trailing: const Text('Calon Istri'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.calendar_today,
                    color: AppColors.primary,
                  ),
                  title: const Text('Rencana Pernikahan'),
                  trailing: const Text('Desember 2026'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.grey),
                  title: const Text('Pengaturan Akun'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
