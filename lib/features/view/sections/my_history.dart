import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = _MyHistoryMetrics.fromContext(context);

    return Container(
      width: double.infinity,
      color: AppColors.surfaceAlt,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: metrics.maxWidth),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: metrics.horizontalPadding,
              vertical: metrics.verticalPadding,
            ),
            child: Padding(
              padding: EdgeInsets.all(metrics.panelPadding),
              child: Responsive.responsive<Widget>(
                context: context,
                mobile: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: _AvatarCircle(imageSize: metrics.avatarSize),
                    ),
                    SizedBox(height: metrics.contentGap),
                    _MyHistoryContent(metrics: metrics),
                  ],
                ),
                tablet: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _AvatarCircle(imageSize: metrics.avatarSize),
                      ),
                    ),
                    SizedBox(width: metrics.contentGap),
                    Expanded(
                      flex: 10,
                      child: _MyHistoryContent(metrics: metrics),
                    ),
                  ],
                ),
                desktop: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _AvatarCircle(imageSize: metrics.avatarSize),
                      ),
                    ),
                    SizedBox(width: metrics.contentGap),
                    Expanded(
                      flex: 10,
                      child: _MyHistoryContent(metrics: metrics),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyHistoryContent extends StatelessWidget {
  const _MyHistoryContent({required this.metrics});

  final _MyHistoryMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: metrics.titleSize,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
            children: const [
              TextSpan(text: 'Minha '),
              TextSpan(
                text: 'Trajetoria',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: metrics.textWidth),
          child: Text(
            'Sou um desenvolvedor apaixonado pela arte de criar softwares que impactam positivamente a vida das pessoas. Com foco total no ecossistema Mobile, dedico meus dias a dominar o Flutter e suas melhores praticas.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: metrics.bodySize,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacing.md,
          mainAxisSpacing: AppSpacing.md,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: metrics.cardAspectRatio,
          children: const [
            _HistoryFeatureCard(
              icon: Icons.flutter_dash,
              title: 'Flutter Expert',
              subtitle: 'Widgets & State Mgmt',
            ),
            _HistoryFeatureCard(
              icon: Icons.storage_rounded,
              title: 'Firebase',
              subtitle: 'Realtime & Auth',
            ),
            _HistoryFeatureCard(
              icon: Icons.architecture,
              title: 'MVVM',
              subtitle: 'Clean Architecture',
            ),
            _HistoryFeatureCard(
              icon: Icons.hub_rounded,
              title: 'REST API',
              subtitle: 'Integration Specialist',
            ),
          ],
        ),
      ],
    );
  }
}

class _HistoryFeatureCard extends StatelessWidget {
  const _HistoryFeatureCard({
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
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 18),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  const _AvatarCircle({required this.imageSize});

  final double imageSize;

  @override
  Widget build(BuildContext context) {
    final ringSize = imageSize * 1.25;

    return SizedBox(
      width: ringSize,
      height: ringSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: ringSize,
            height: ringSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.32)),
            ),
          ),
          Container(
            width: ringSize * 0.92,
            height: ringSize * 0.92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withOpacity(0.24),
                  AppColors.background,
                ],
              ),
            ),
          ),
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.55)),
              image: const DecorationImage(
                image: AssetImage('assets/photo/jonathan_oishi.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyHistoryMetrics {
  const _MyHistoryMetrics({
    required this.maxWidth,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.panelPadding,
    required this.contentGap,
    required this.avatarSize,
    required this.titleSize,
    required this.bodySize,
    required this.textWidth,
    required this.cardAspectRatio,
  });

  final double maxWidth;
  final double horizontalPadding;
  final double verticalPadding;
  final double panelPadding;
  final double contentGap;
  final double avatarSize;
  final double titleSize;
  final double bodySize;
  final double textWidth;
  final double cardAspectRatio;

  static _MyHistoryMetrics fromContext(BuildContext context) {
    return Responsive.responsive<_MyHistoryMetrics>(
      context: context,
      mobile: const _MyHistoryMetrics(
        maxWidth: 720,
        horizontalPadding: 16,
        verticalPadding: 36,
        panelPadding: 18,
        contentGap: 18,
        avatarSize: 140,
        titleSize: 34,
        bodySize: 13,
        textWidth: 340,
        cardAspectRatio: 1.3,
      ),
      tablet: const _MyHistoryMetrics(
        maxWidth: 980,
        horizontalPadding: 40,
        verticalPadding: 72,
        panelPadding: 34,
        contentGap: 26,
        avatarSize: 230,
        titleSize: 52,
        bodySize: 19,
        textWidth: 520,
        cardAspectRatio: 1.95,
      ),
      desktop: const _MyHistoryMetrics(
        maxWidth: 1240,
        horizontalPadding: 72,
        verticalPadding: 88,
        panelPadding: 42,
        contentGap: 36,
        avatarSize: 265,
        titleSize: 56,
        bodySize: 21,
        textWidth: 560,
        cardAspectRatio: 2.15,
      ),
    );
  }
}
