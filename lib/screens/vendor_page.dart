import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../helpers/app_helpers.dart';
import '../models/vendor_model.dart';
import 'vendor_detail_page.dart';

class VendorPage extends StatefulWidget {
  final String initialCategory;
  final String initialQuery;

  const VendorPage({
    super.key,
    this.initialCategory = 'Semua',
    this.initialQuery = '',
  });

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  static const _categories = [
    'Semua',
    'Katering',
    'Dekorasi',
    'Busana & Rias',
    'Foto & Video',
  ];

  late String _category = widget.initialCategory;
  late String _query = widget.initialQuery;
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialQuery,
  );
  final Set<String> _favorites = {};

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openDetail(Vendor v) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => VendorDetailPage(
          name: v.name,
          category: v.category,
          harga: v.price,
          isFavorite: _favorites.contains(v.name),
        ),
      ),
    );

    if (!mounted) return;
    if (result != null) {
      setState(() {
        if (result) {
          _favorites.add(v.name);
        } else {
          _favorites.remove(v.name);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = kVendors.where((v) {
      final okCat = _category == 'Semua' || v.category == _category;
      final okQuery = v.name.toLowerCase().contains(_query.toLowerCase());
      return okCat && okQuery;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _controller,
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Cari nama vendor',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: _categories
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(c),
                      selected: _category == c,
                      onSelected: (_) => setState(() => _category = c),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? const Center(child: Text('Vendor tidak ditemukan'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final v = list[i];
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.soft,
                          child: Icon(
                            categoryIcon(v.category),
                            color: AppColors.primary,
                          ),
                        ),
                        title: Text(
                          v.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${v.category} • ★ ${v.rating}\n${rupiah(v.price)}',
                        ),
                        isThreeLine: true,
                        trailing: _favorites.contains(v.name)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.chevron_right),
                        onTap: () => _openDetail(v),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
