import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.responsive<double>(
      context: context,
      mobile: 20,
      tablet: 40,
      desktop: 72,
    );

    final maxWidth = Responsive.responsive<double>(
      context: context,
      mobile: 720,
      tablet: 980,
      desktop: 1240,
    );

    final titleSize = Responsive.responsive<double>(
      context: context,
      mobile: 36,
      tablet: 46,
      desktop: 52,
    );

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: AppSpacing.xxxl,
            ),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      height: 1.1,
                    ),
                    children: const [
                      TextSpan(text: 'Stack '),
                      TextSpan(
                        text: 'Tecnologica',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'As ferramentas que utilizo para construir o futuro do mobile.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                const _TechGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TechGrid extends StatelessWidget {
  const _TechGrid();

  @override
  Widget build(BuildContext context) {
    final cards = [
      _TechItem(
        icon: Icons.flutter_dash,
        title: 'Flutter',
        subtitle: 'Framework',
      ),
      _TechItem(icon: Icons.code_rounded, title: 'Dart', subtitle: 'Language'),
      _TechItem(
        icon: Icons.storage_rounded,
        title: 'Firebase',
        subtitle: 'Backend',
      ),
      _TechItem(
        icon: Icons.hub_rounded,
        title: 'GitHub',
        subtitle: 'Versioning',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 920;
        final crossCount = isWide ? 4 : 2;
        final ratio = isWide ? 1.8 : 1.6;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) => cards[index],
        );
      },
    );
  }
}

class _TechItem extends StatelessWidget {
  const _TechItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
