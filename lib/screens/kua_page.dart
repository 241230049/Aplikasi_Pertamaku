import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/kua_model.dart';

class KuaPage extends StatelessWidget {
  const KuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: kKua.length,
      itemBuilder: (context, i) {
        final kua = kKua[i];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.soft,
              child: Icon(Icons.location_on, color: AppColors.primary),
            ),
            title: Text(
              kua.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${kua.address}\nJam: ${kua.hours}'),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.directions, color: AppColors.primary),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Mengarahkan ke ${kua.name}')),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
