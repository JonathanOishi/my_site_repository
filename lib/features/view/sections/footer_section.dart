import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Detecta o espaçamento da barra inferior do sistema (iPhone/Androids novos)
    final bottomPadding = MediaQuery.of(context).padding.bottom;

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
              vertical: AppSpacing.xxl,
            ),
            // Mudamos para uma Column para injetar o espaçamento de segurança no final de tudo
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Responsive.responsive<Widget>(
                  context: context,
                  mobile: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FooterBrand(),
                      SizedBox(height: AppSpacing.xl),
                      _FooterLinks(),
                      SizedBox(height: AppSpacing.lg),
                      _FooterSocial(),
                    ],
                  ),
                  tablet: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: _FooterBrand(),
                      ),
                      const SizedBox(width: AppSpacing.xxl),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: const [
                            Expanded(child: _FooterLinks()),
                            Expanded(child: _FooterSocial()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: _FooterBrand(),
                      ),
                      const SizedBox(width: AppSpacing.xxl),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: const [
                            Expanded(child: _FooterLinks()),
                            Expanded(child: _FooterSocial()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // MUDANÇA AQUI: Adiciona o espaçamento dinâmico para a barra de navegação do celular
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
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Especialista em criar pontes digitais entre\nsolucoes complexas e solucoes mobile.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACESSO RAPIDO',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        _LinkLabel('Inicio'),
        _LinkLabel('Sobre Mim'),
        _LinkLabel('Projetos'),
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
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Row(
          children: [
            _SocialDot(icon: Icons.code),
            SizedBox(width: AppSpacing.sm),
            _SocialDot(icon: Icons.alternate_email),
            SizedBox(width: AppSpacing.sm),
            _SocialDot(icon: Icons.camera_alt_outlined),
          ],
        ),
      ],
    );
  }
}

class _SocialDot extends StatelessWidget {
  const _SocialDot({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: AppColors.surfaceSoft,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 14, color: AppColors.textPrimary),
    );
  }
}

class _LinkLabel extends StatelessWidget {
  const _LinkLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),
      ),
    );
  }
}
