import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
                      TextSpan(text: 'Experiencia '),
                      TextSpan(
                        text: 'Profissional',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                const _TimelineNode(
                  side: _TimelineSide.right,
                  period: '2024 - 2025',
                  title: 'Arquiteto Desenvolvedor\nSênior',
                  description:
                      'Atuacao no planejamento de modulo interno e decisao de arquitetura corporativa.',
                ),
                const _TimelineNode(
                  side: _TimelineSide.left,
                  period: 'INICIO ATUAL',
                  title: 'Objective: Dev Flutter Junior',
                  description:
                      'Desenvolvimento orientado a performance e valor para produtos digitais.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _TimelineSide { left, right }

class _TimelineNode extends StatelessWidget {
  const _TimelineNode({
    required this.side,
    required this.period,
    required this.title,
    required this.description,
  });

  final _TimelineSide side;
  final String period;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return SizedBox(
        height: 158,
        child: Row(
          children: [
            SizedBox(
              width: 18,
              child: Column(
                children: [
                  Expanded(child: Container(width: 1, color: AppColors.border)),
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(child: Container(width: 1, color: AppColors.border)),
                ],
              ),
            ),
            Expanded(
              child: _Card(
                period: period,
                title: title,
                description: description,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: side == _TimelineSide.left
                ? _Card(period: period, title: title, description: description)
                : const SizedBox.shrink(),
          ),
          SizedBox(
            width: 38,
            child: Column(
              children: [
                Expanded(
                  child: Container(width: 1, color: AppColors.border),
                ),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Container(width: 1, color: AppColors.border),
                ),
              ],
            ),
          ),
          Expanded(
            child: side == _TimelineSide.right
                ? _Card(period: period, title: title, description: description)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.period,
    required this.title,
    required this.description,
  });

  final String period;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.surface,
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
              height: 1.25,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
