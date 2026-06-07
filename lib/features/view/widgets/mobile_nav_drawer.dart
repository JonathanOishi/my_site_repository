import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/navigation/home_nav_item.dart';

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  final List<HomeNavItem> items;
  final ValueChanged<String> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Text(
                'Navegacao',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Divider(height: 1, color: AppColors.borderStrong),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, _) => const Divider(
                  height: 1,
                  color: AppColors.border,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];

                  if (item.isPrimary) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: ElevatedButton(
                        onPressed: () => onItemTap(item.id),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textPrimary,
                          minimumSize: const Size(double.infinity, 44),
                        ),
                        child: Text(item.label),
                      ),
                    );
                  }

                  return ListTile(
                    title: Text(
                      item.label,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () => onItemTap(item.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
