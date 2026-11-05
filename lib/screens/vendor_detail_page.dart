import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../helpers/app_helpers.dart';

class VendorDetailPage extends StatelessWidget {
  final String name;
  final String category;
  final int harga;
  final bool isFavorite;

  const VendorDetailPage({
    super.key,
    required this.name,
    required this.category,
    required this.harga,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Vendor'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categoryIcon(category), size: 72, color: AppColors.primary),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(category, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 8),
              Text(
                'Mulai dari ${rupiah(harga)}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context, !isFavorite),
                icon: Icon(isFavorite ? Icons.favorite_border : Icons.favorite),
                label: Text(
                  isFavorite ? 'Hapus dari favorit' : 'Simpan ke favorit',
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali tanpa mengubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
