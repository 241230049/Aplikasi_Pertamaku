import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'screens/main_shell.dart';

void main() => runApp(const NikahApp());

class NikahApp extends StatelessWidget {
  const NikahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NikahKu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
      ),
      home: const MainShell(),
    );
  }
}
