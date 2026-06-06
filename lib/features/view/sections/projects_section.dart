import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
      mobile: 34,
      tablet: 44,
      desktop: 50,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Responsive.responsive<Widget>(
                  context: context,
                  mobile: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                          children: const [
                            TextSpan(text: 'Projetos em '),
                            TextSpan(
                              text: 'Destaque',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      const Text(
                        'VER TODO CATALOGO',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  tablet: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                          children: const [
                            TextSpan(text: 'Projetos em '),
                            TextSpan(
                              text: 'Destaque',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Ver todo catalogo',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  desktop: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                          children: const [
                            TextSpan(text: 'Projetos em '),
                            TextSpan(
                              text: 'Destaque',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Ver todo catalogo',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                const _ProjectsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  const _ProjectsGrid();

  @override
  Widget build(BuildContext context) {
    final cards = const [
      _ProjectCard(
        tag: 'FLUTTER',
        title: 'OneTasks',
        description:
            'Gerenciamento de tarefas com gamificacao e notificacoes inteligentes.',
      ),
      _ProjectCard(
        tag: 'MVVM',
        title: 'VacitAP Search',
        description:
            'Busca de vacinacao inteligente API REST com arquitetura MVVM.',
      ),
      _ProjectCard(
        tag: 'FIREBASE',
        title: 'Workout Tracker',
        description:
            'Monitoramento de treinos com Firebase e painel de evolucao.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = Responsive.isMobile(context);
        final isDesktop = constraints.maxWidth >= 1000;
        final crossCount = isDesktop
            ? 3
            : isMobile
            ? 1
            : 2;
        final ratio = isDesktop
            ? 0.84
            : isMobile
            ? 0.95
            : 0.92;

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

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.tag,
    required this.title,
    required this.description,
  });

  final String tag;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            child: Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.rail,
                        AppColors.primary.withOpacity(0.25),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.smartphone,
                    size: 54,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textPrimary,
                        minimumSize: const Size(96, 36),
                      ),
                      child: const Text('Preview'),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(84, 36),
                        side: const BorderSide(color: AppColors.border),
                        foregroundColor: AppColors.textPrimary,
                      ),
                      child: const Text('Codigo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
