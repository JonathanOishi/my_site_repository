import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class ServicesSection extends StatelessWidget {
  final VoidCallback onContactPressed;

  const ServicesSection({
    super.key,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
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

    final services = [
      _ServiceData(
        icon: Icons.phone_android_rounded,
        title: 'Desenvolvimento Mobile',
        description:
            'Criação de aplicativos nativos e híbridos sob medida de alta performance. Um único código fonte rodando de forma fluida, rápida e responsiva tanto em Android quanto em iOS.',
        features: [
          'Flutter & Dart',
          'Gerenciamento Estados',
          'APIs',
          'Banco de dados local',
          'Aplicativos Android e IOS',
          'Publicação nas Lojas',
        ],
        buttonText: 'Solicitar Orçamento',
      ),
      _ServiceData(
        icon: Icons.web_rounded,
        title: 'Landing Pages',
        description:
            'Criação de Landing Pages profissionais e estratégicas, desenvolvidas para destacar sua marca, captar leads e aumentar conversões. Do jeito solicitado.',
        features: [
          'Alta Conversão',
          'Responsividade Total',
          'Otimização SEO',
          'Design UI/UX Moderno',
          'Integração com WhatsApp',
          'Captação de Leads',
        ],
        buttonText: 'Consultar Valores',
      ),
      _ServiceData(
        icon: Icons.architecture_rounded,
        title: 'Consultoria Técnica',
        description:
            'Direcionamento estratégico focado em resolver gargalos. Analiso a estrutura do seu projeto para garantir códigos limpos, escaláveis e uma infraestrutura moderna pronta para crescer.',
        features: [
          'Arquitetura Limpa / MVVM',
          'Princípios SOLID',
          'Code Review profissional',
          'Otimização de performance',
          'Automação CI/CD',
          'Infraestrutura escalável',
        ],
        buttonText: 'Agendar Conversa',
      ),
    ];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SERVIÇOS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1EA69A),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Como posso ajudar o seu negócio',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 48),
                Responsive.responsive<Widget>(
                  context: context,
                  mobile: Column(
                    children: services
                        .map(
                          (s) => Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: _ServiceCard(
                              data: s,
                              onPressed: onContactPressed,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  tablet: Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: services.map((s) {
                      final screenWidth = MediaQuery.of(context).size.width;
                      final cardWidth =
                          (screenWidth - (horizontalPadding * 2) - 24) / 2;
                      return SizedBox(
                        width: cardWidth,
                        child: _ServiceCard(
                          data: s,
                          onPressed: onContactPressed,
                        ),
                      );
                    }).toList(),
                  ),
                  desktop: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: services
                          .map(
                            (s) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: s == services.last ? 0 : 24,
                                ),
                                child: _ServiceCard(
                                  data: s,
                                  onPressed: onContactPressed,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceData {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;
  final String buttonText;

  const _ServiceData({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
    required this.buttonText,
  });
}

class _ServiceCard extends StatefulWidget {
  final _ServiceData data;
  final VoidCallback onPressed;

  const _ServiceCard({required this.data, required this.onPressed});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF1EA69A);
    final isMobile = Responsive.isMobile(context);

    final cardContent = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isHovered
              ? buttonColor.withValues(alpha: 0.40)
              : AppColors.border,
          width: isHovered ? 1.5 : 1.0,
        ),
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: buttonColor.withValues(alpha: .06),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isHovered
                  ? buttonColor
                  : buttonColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              widget.data.icon,
              color: isHovered ? Colors.white : buttonColor,
              size: 22,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.data.title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.data.description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),

          ...widget.data.features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: buttonColor,
                    size: 16,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                elevation: isHovered ? 4 : 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: widget.onPressed,
              child: Text(
                widget.data.buttonText,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    if (isMobile) return cardContent;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: cardContent,
    );
  }
}
