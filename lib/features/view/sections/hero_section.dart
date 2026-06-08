// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/particles/particles_back.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.heroHeight(context),
      color: AppColors.background,
      child: Stack(
        children: [
          const Positioned.fill(
            child: ParticleBackground(),
          ),

          Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.maxContentWidth(context),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Responsive.isMobile(context)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _HeroTextContent(),
                          SizedBox(height: 40),
                          _HeroPhoto(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: _HeroTextContent(),
                          ),
                          SizedBox(width: 48),
                          Expanded(
                            child: _HeroPhoto(),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroTextContent extends StatelessWidget {
  const _HeroTextContent();

  @override
  Widget build(BuildContext context) {
    final metrics = _HeroMetrics.fromContext(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'DISPONÍVEL PARA NOVOS PROJETOS',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: metrics.labelFontSize,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.8,
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          Text.rich(
            TextSpan(
              style: TextStyle(
                height: 1.03,
                fontSize: metrics.titleFontSize,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
              children: const [
                TextSpan(text: 'DESENVOLVEDOR\n'),
                TextSpan(
                  text: 'FLUTTER',
                  style: TextStyle(color: AppColors.primary),
                ),
                TextSpan(text: ' & MOBILE'),
              ],
            ),
            textAlign: Responsive.isMobile(context)
                ? TextAlign.center
                : TextAlign.start,
          ),

          const SizedBox(height: AppSpacing.lg),

          SizedBox(
            width: metrics.textMaxWidth,
            child: Text(
              'Transformando ideias complexas em experiências mobile refinadas. Especialista em ecossistema Flutter, Dart e integração robusta com Firebase.',
              textAlign: Responsive.isMobile(context)
                  ? TextAlign.center
                  : TextAlign.start,
              style: TextStyle(
                height: 1.55,
                fontSize: metrics.subtitleFontSize,
                color: AppColors.textSecondary,
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Ver Projetos'),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Baixar Currículo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroPhoto extends StatelessWidget {
  const _HeroPhoto();

  @override
  Widget build(BuildContext context) {
    final metrics = _HeroMetrics.fromContext(context);
    final maxImageWidth = metrics.maxImageWidth;

    return SizedBox(
      width: maxImageWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: maxImageWidth * 0.78,
            height: maxImageWidth * 0.78,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withOpacity(0.28),
                  AppColors.primary.withOpacity(0.02),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/logo_flutter.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _HeroMetrics {
  const _HeroMetrics({
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.contentMaxWidth,
    required this.contentGap,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.labelFontSize,
    required this.textMaxWidth,
    required this.primaryButtonWidth,
    required this.secondaryButtonWidth,
    required this.maxImageWidth,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final double contentMaxWidth;
  final double contentGap;
  final double titleFontSize;
  final double subtitleFontSize;
  final double labelFontSize;
  final double textMaxWidth;
  final double primaryButtonWidth;
  final double secondaryButtonWidth;
  final double maxImageWidth;

  static _HeroMetrics fromContext(BuildContext context) {
    return Responsive.responsive<_HeroMetrics>(
      context: context,
      mobile: const _HeroMetrics(
        horizontalPadding: 20,
        verticalPadding: 40,
        contentMaxWidth: 720,
        contentGap: 0,
        titleFontSize: 36,
        subtitleFontSize: 14,
        labelFontSize: 11,
        textMaxWidth: 420,
        primaryButtonWidth: 148,
        secondaryButtonWidth: 156,
        maxImageWidth: 230,
      ),
      tablet: const _HeroMetrics(
        horizontalPadding: 40,
        verticalPadding: 72,
        contentMaxWidth: 980,
        contentGap: 32,
        titleFontSize: 56,
        subtitleFontSize: 17,
        labelFontSize: 12,
        textMaxWidth: 500,
        primaryButtonWidth: 160,
        secondaryButtonWidth: 172,
        maxImageWidth: 420,
      ),
      desktop: const _HeroMetrics(
        horizontalPadding: 72,
        verticalPadding: 96,
        contentMaxWidth: 1240,
        contentGap: 56,
        titleFontSize: 64,
        subtitleFontSize: 19,
        labelFontSize: 12,
        textMaxWidth: 620,
        primaryButtonWidth: 168,
        secondaryButtonWidth: 184,
        maxImageWidth: 510,
      ),
    );
  }
}
