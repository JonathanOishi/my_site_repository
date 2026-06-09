import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
                    ),
                    children: const [
                      TextSpan(text: 'Formação '),
                      TextSpan(
                        text: 'Acadêmica',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                const _EducationNode(
                  side: _NodeSide.left,
                  period: '2025 - 2026 em Andamento',
                  title:
                      'Pós-graduação em\nDesenvolvimento Mobile\n(Android e Multiplataforma)',
                  subtitle: 'Instituição: INFNET ',
                ),

                const SizedBox(height: AppSpacing.lg),

                const _EducationNode(
                  side: _NodeSide.right,
                  period: 'CONCLUÍDO em 2024',
                  title:
                      'Tecnólogo em Análise e\nDesenvolvimento de Sistemas\n(ADS)',
                  subtitle: 'UNG',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _NodeSide { left, right }

class _EducationNode extends StatelessWidget {
  const _EducationNode({
    required this.side,
    required this.period,
    required this.title,
    required this.subtitle,
  });

  final _NodeSide side;
  final String period;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    Widget buildDot(double size) {
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
      );
    }

    // 🔥 MOBILE
    if (isMobile) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 18,
              child: Column(
                children: [
                  Expanded(child: Container(width: 1, color: AppColors.border)),
                  buildDot(7),
                  Expanded(child: Container(width: 1, color: AppColors.border)),
                ],
              ),
            ),

            Expanded(
              child: _EducationCard(
                period: period,
                title: title,
                subtitle: subtitle,
              ),
            ),
          ],
        ),
      );
    }

    // 🔥 DESKTOP
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: side == _NodeSide.left
                ? _EducationCard(
                    period: period,
                    title: title,
                    subtitle: subtitle,
                  )
                : const SizedBox.shrink(),
          ),

          SizedBox(
            width: 38,
            child: Column(
              children: [
                Expanded(child: Container(width: 1, color: AppColors.border)),
                buildDot(8),
                Expanded(child: Container(width: 1, color: AppColors.border)),
              ],
            ),
          ),

          Expanded(
            child: side == _NodeSide.right
                ? _EducationCard(
                    period: period,
                    title: title,
                    subtitle: subtitle,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({
    required this.period,
    required this.title,
    required this.subtitle,
  });

  final String period;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.surfaceSoft,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            period,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          const SizedBox(height: AppSpacing.xs),

          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
