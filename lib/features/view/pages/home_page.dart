import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('FUNCIONOU!');
          },
          child: const Text('Testar Toque'),
        ),
      ),
    );
  }
}
