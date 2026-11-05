import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SubPage extends StatelessWidget {
  final String title;
  final Widget child;

  const SubPage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: child,
    );
  }
}
