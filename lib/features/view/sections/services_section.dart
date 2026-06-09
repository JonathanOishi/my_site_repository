import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final cardWidth = Responsive.responsive<double>(
      context: context,
      mobile: double.infinity,
      tablet: 340,
      desktop: 360,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 80 : 120,
      ),
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.maxContentWidth(context),
          ),
          child: Column(
            children: [
              Text(
                'Solicitar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 34 : 54,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: isMobile ? 34 : 54,
                    fontWeight: FontWeight.w800,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Orçamento & ',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: 'Serviços',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Text(
                  'Transforme sua ideia em realidade. Solicite um orçamento para seu novo aplicativo, sistema ou solução digital.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: const ServiceCard(
                      icon: Icons.psychology,
                      title: 'Consultoria Técnica',
                      description:
                          'Análise de arquitetura, revisão de código e mentoria em melhores práticas.',
                      features: [
                        'Arquitetura MVVM',
                        'Otimização de Código',
                        'Escalabilidade',
                      ],
                      buttonText: 'Agendar Conversa',
                    ),
                  ),

                  SizedBox(
                    width: cardWidth,
                    child: const ServiceCard(
                      icon: Icons.phone_android,
                      title: 'Desenvolvimento Mobile\n(Flutter)',
                      description:
                          'Apps de alta performance para Android e iOS com código único e design nativo.',
                      features: [
                        'Clean Architecture',
                        'Integração Firebase',
                        'Publicação nas Lojas',
                      ],
                      buttonText: 'Solicitar Orçamento',
                    ),
                  ),

                  SizedBox(
                    width: cardWidth,
                    child: const ServiceCard(
                      icon: Icons.language,
                      title: 'Desenvolvimento Web (SaaS/Landing)',
                      description:
                          'Experiências web modernas, responsivas e otimizadas para conversão.',
                      features: [
                        'Design Responsivo',
                        'SEO & Performance',
                        'Painel Administrativo',
                      ],
                      buttonText: 'Consultar Valores',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
    required this.buttonText,
  });

  final IconData icon;
  final String title;
  final String description;
  final List<String> features;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final cardHeight = Responsive.responsive<double>(
      context: context,
      mobile: 520,
      tablet: 560,
      desktop: 560,
    );

    return Container(
      height: cardHeight,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: .12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 34,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 24),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: AppColors.primary,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
