import 'package:flutter/foundation.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Responsive.responsive<Widget>(
                  context: context,
                  mobile: _buildHeader(titleSize, isMobile: true),
                  tablet: _buildHeader(titleSize),
                  desktop: _buildHeader(titleSize),
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

  Widget _buildHeader(double titleSize, {bool isMobile = false}) {
    final title = Text.rich(
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
    );

    final link = Text(
      isMobile ? 'VER TODO CATÁLOGO' : 'Ver todo catálogo',
      style: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(height: 6),
          link,
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [title, link],
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
            'Gerenciamento de tarefas com gamificação e notificações inteligentes.',
        imageLink: 'assets/my_financy.png',
      ),
      _ProjectCard(
        tag: 'FINTECH',
        title: 'Finance App',
        description: 'Controle financeiro moderno e minimalista.',
        imageLink: 'assets/my_financy.png',
      ),
    ];

    final isMobile = Responsive.isMobile(context);

    /// 📱 MOBILE = CAROUSEL (Apple App Store style)
    if (isMobile) {
      return SizedBox(
        height: 520,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.88),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: cards[index],
            );
          },
        ),
      );
    }

    /// 💻 TABLET / DESKTOP = GRID
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1000;

        final crossCount = isDesktop ? 3 : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            mainAxisExtent: 520,
          ),
          itemBuilder: (context, index) => cards[index],
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.tag,
    required this.title,
    required this.description,
    required this.imageLink,
  });

  final String tag;
  final String title;
  final String description;
  final String imageLink;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: (isWeb && isHovered)
            ? (Matrix4.identity()..scale(1.02))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
          boxShadow: (isWeb && isHovered)
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  )
                ]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE HERO (Apple style)
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.imageLink,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.25),
                          Colors.transparent,
                        ],
                      ),
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
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.tag,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
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
                        ),
                        child: const Text("Preview"),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text("Código"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
