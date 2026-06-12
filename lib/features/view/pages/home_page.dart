import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/nav_bar.dart';
import 'package:jonathan_oishi_portfolio/features/view/navigation/home_nav_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Navbar(
            items: homeNavItems,
            onItemTap: (_) {},
            onMenuTap: () {},
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => debugPrint('FUNCIONOU!'),
              child: const Text('Testar Toque'),
            ),
          ),
        ],
      ),
    );
  }
}
