// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback? onScrollToTop;

  const FooterSection({
    super.key,
    this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    final horizontalPadding = Responsive.responsive<double>(
      context: context,
      mobile: 24,
      tablet: 48,
      desktop: 72,
    );

    final maxWidth = Responsive.responsive<double>(
      context: context,
      mobile: 720,
      tablet: 980,
      desktop: 1240,
    );

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              AppSpacing.xxl,
              horizontalPadding,
              AppSpacing.xl,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Responsive.responsive<Widget>(
                  context: context,
                  mobile: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _FooterBrand(),
                      const SizedBox(height: AppSpacing.xl),
                      const _FooterSocial(),
                      if (onScrollToTop != null) ...[
                        const SizedBox(height: AppSpacing.xl),
                        _ScrollToTopButton(onPressed: onScrollToTop!),
                      ],
                    ],
                  ),
                  tablet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 5,
                        child: _FooterBrand(),
                      ),
                      const SizedBox(width: AppSpacing.xxl),
                      Expanded(
                        flex: 4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _FooterSocial(),
                            if (onScrollToTop != null)
                              _ScrollToTopButton(onPressed: onScrollToTop!),
                          ],
                        ),
                      ),
                    ],
                  ),
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 6,
                        child: _FooterBrand(),
                      ),
                      const SizedBox(width: AppSpacing.xxl),
                      Expanded(
                        flex: 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _FooterSocial(),
                            if (onScrollToTop != null)
                              _ScrollToTopButton(onPressed: onScrollToTop!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                const Divider(color: AppColors.border, thickness: 0.8),
                const SizedBox(height: 24),
                Responsive.responsive<Widget>(
                  context: context,
                  mobile: const Column(
                    children: [
                      Text(
                        '© 2026 Jonathan Oishi. Todos os direitos reservados.',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      _FlutterBadge(),
                    ],
                  ),
                  tablet: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '© 2026 Jonathan Oishi. Todos os direitos reservados.',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      _FlutterBadge(),
                    ],
                  ),
                  desktop: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '© 2026 Jonathan Oishi. Todos os direitos reservados.',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      _FlutterBadge(),
                    ],
                  ),
                ),
                if (bottomPadding > 0) SizedBox(height: bottomPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  const _FooterBrand();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'JONATHAN OISHI',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Engenheiro de Software focado e especializado no ecossistema Flutter e Dart. Desenvolvo aplicações robustas, fluidas e de alto desempenho para Android, iOS e Web a partir de uma única base de código, aliando Clean Architecture a designs inteligentes orientados à experiência do usuário.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _FooterSocial extends StatelessWidget {
  const _FooterSocial();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONECTE-SE',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Row(
          children: [
            _SocialImageLink(
              imagePath: 'assets/github_icon.png',
              url: 'https://github.com/JonathanOishi',
              tooltip: 'GitHub',
            ),
            SizedBox(width: AppSpacing.md),
            _SocialImageLink(
              imagePath: 'assets/link_icon.png',
              url: 'https://www.linkedin.com/in/jonathanoishi/',
              tooltip: 'LinkedIn',
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialImageLink extends StatefulWidget {
  final String imagePath;
  final String url;
  final String tooltip;

  const _SocialImageLink({
    required this.imagePath,
    required this.url,
    required this.tooltip,
  });

  @override
  State<_SocialImageLink> createState() => _SocialImageLinkState();
}

class _SocialImageLinkState extends State<_SocialImageLink> {
  bool isHovered = false;

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir o link: ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    const highlightColor = Color(0xFF1EA69A);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          onTap: _launchURL,
          borderRadius: BorderRadius.circular(28),
          hoverColor: Colors.transparent,
          splashColor: highlightColor.withValues(alpha: 0.3),
          highlightColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(
              14,
            ),
            decoration: BoxDecoration(
              color: isHovered
                  ? highlightColor.withValues(alpha: 0.15)
                  : AppColors.surfaceAlt,
              shape: BoxShape.circle,
              border: Border.all(
                color: isHovered ? highlightColor : AppColors.border,
                width: 1.5,
              ),
            ),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class _ScrollToTopButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _ScrollToTopButton({required this.onPressed});

  @override
  State<_ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<_ScrollToTopButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    const highlightColor = Color(0xFF1EA69A);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isHovered ? highlightColor : AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isHovered ? highlightColor : AppColors.border,
          ),
        ),
        child: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            Icons.arrow_upward_rounded,
            color: isHovered ? Colors.white : AppColors.textPrimary,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class _FlutterBadge extends StatelessWidget {
  const _FlutterBadge();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Construído com ',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF02569B).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color(0xFF02569B).withValues(alpha: 0.4),
            ),
          ),
          child: const Row(
            children: [
              FlutterLogo(size: 14),
              SizedBox(width: 4),
              Text(
                'Flutter',
                style: TextStyle(
                  color: Color(0xFF0175C2),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
