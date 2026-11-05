import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SuratPage extends StatefulWidget {
  const SuratPage({super.key});

  @override
  State<SuratPage> createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  final Map<String, bool> _done = {
    'Surat Pengantar RT/RW': false,
    'Fotokopi KTP calon pengantin': false,
    'Kartu Keluarga': false,
    'Akta Kelahiran / Ijazah': false,
    'Formulir Model N1-N4': false,
    'Pas foto 2x3 / 4x6': false,
    'Surat Izin Wali (jika perlu)': false,
    'Surat Rekomendasi Nikah': false,
  };

  @override
  Widget build(BuildContext context) {
    final total = _done.length;
    final count = _done.values.where((v) => v).length;
    final progress = count / total;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Kelengkapan Berkas Nikah',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text('$count dari $total berkas siap'),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, box) => Stack(
            children: [
              Container(
                height: 10,
                width: box.maxWidth,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: 10,
                width: box.maxWidth * progress,
                decoration: BoxDecoration(
                  color: progress == 1 ? Colors.green : AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ..._done.keys.map(
          (k) => Card(
            color: Colors.white,
            child: CheckboxListTile(
              value: _done[k],
              title: Text(k),
              activeColor: AppColors.primary,
              onChanged: (v) => setState(() => _done[k] = v ?? false),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          onPressed: progress == 1
              ? () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Berkas berhasil diajukan ke KUA'),
                  ),
                )
              : null,
          child: const Text('Ajukan ke KUA'),
        ),
      ],
    );
  }
}
