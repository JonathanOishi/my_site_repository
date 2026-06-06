import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/navigation/home_nav_item.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required this.items,
    required this.onItemTap,
    required this.onMenuTap,
  });

  final List<HomeNavItem> items;
  final ValueChanged<String> onItemTap;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final itemPadding = Responsive.responsive<double>(
      context: context,
      mobile: 16,
      tablet: 24,
      desktop: 28,
    );

    return Container(
      height: isMobile ? 64 : 80,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      child: isMobile
          ? Row(
              children: [
                const Expanded(
                  child: Text(
                    'JONATHAN OISHI',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu_rounded),
                  style: IconButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                  ),
                ),
              ],
            )
          : Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Jonathan Oishi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 24),
                    ...items
                        .where((item) => !item.isPrimary)
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.only(right: itemPadding),
                            child: TextButton(
                              onPressed: () => onItemTap(item.id),
                              child: Text(item.label),
                            ),
                          ),
                        ),
                    ...items
                        .where((item) => item.isPrimary)
                        .map(
                          (item) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            onPressed: () => onItemTap(item.id),
                            child: Text(
                              item.label,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
    );
  }
}
