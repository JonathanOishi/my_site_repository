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
      color: AppColors.surfaceAlt,
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
                      TextSpan(text: 'Experiência '),
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
                  isCurrent: false,
                ),

                const SizedBox(height: AppSpacing.lg),

                const _TimelineNode(
                  side: _TimelineSide.left,
                  period: 'INICIO ATUAL',
                  title: 'Objective: Dev Flutter Junior',
                  description:
                      'Desenvolvimento orientado a performance e valor para produtos digitais.',
                  isCurrent: true,
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
    this.isCurrent = false,
  });

  final _TimelineSide side;
  final String period;
  final String title;
  final String description;
  final bool isCurrent;

  Widget _buildDot(double size) {
    if (isCurrent) {
      return BlinkingDot(size: size);
    }

    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

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
                  _buildDot(7),
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

    // 🔥 DESKTOP
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: side == _TimelineSide.left
                ? _Card(
                    period: period,
                    title: title,
                    description: description,
                  )
                : const SizedBox.shrink(),
          ),

          SizedBox(
            width: 38,
            child: Column(
              children: [
                Expanded(child: Container(width: 1, color: AppColors.border)),
                _buildDot(8),
                Expanded(child: Container(width: 1, color: AppColors.border)),
              ],
            ),
          ),

          Expanded(
            child: side == _TimelineSide.right
                ? _Card(
                    period: period,
                    title: title,
                    description: description,
                  )
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

class BlinkingDot extends StatefulWidget {
  final double size;
  final Color color;

  const BlinkingDot({
    super.key,
    required this.size,
    this.color = AppColors.primary,
  });

  @override
  State<BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.15, end: 0.55).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.size * 2.8,
              height: widget.size * 2.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withOpacity(_animation.value),
              ),
            ),
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
              ),
            ),
          ],
        );
      },
    );
  }
}
