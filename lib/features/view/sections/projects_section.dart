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
                _Header(titleSize: titleSize),
                const SizedBox(height: AppSpacing.lg),
                const _ProjectsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final double titleSize;

  const _Header({required this.titleSize});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

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
      isMobile ? 'VER CATÁLOGO' : 'Ver todo catálogo',
      style: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
    );

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 6),
              link,
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [title, link],
          );
  }
}

class _ProjectsGrid extends StatefulWidget {
  const _ProjectsGrid();

  @override
  State<_ProjectsGrid> createState() => _ProjectsGridState();
}

class _ProjectsGridState extends State<_ProjectsGrid> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      viewportFraction: 0.95,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = const [
      _ProjectCard(
        tag: 'Kotlin',
        title: 'MyFinancy',
        description:
            'My Finances Aplicativo Android desenvolvido em Kotlin para gestão financeira pessoal, com autenticação de usuários, controle de transações, integração com Firebase, consumo de API REST e arquitetura MVVM.',
        imageLink: 'assets/my_financy.png',
      ),
      _ProjectCard(
        tag: 'Flutter',
        title: 'GeoTasks',
        description:
            'Aplicativo de gerenciamento de tarefas desenvolvido em Flutter, com autenticação, sincronização em tempo real, geolocalização e gerenciamento de perfil. Utiliza arquitetura MVVM, Provider e Firebase para persistência e autenticação.',
        imageLink: 'assets/geo_tasks.png',
      ),
    ];

    final isMobile = Responsive.isMobile(context);

    // 📱 MOBILE
    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            height: 480,
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double value = 1.0;

                    if (_controller.position.haveDimensions) {
                      value = (_controller.page! - index).abs();
                      value = (1 - (value * 0.18)).clamp(0.85, 1.0);
                    }

                    return Transform.scale(
                      scale: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: cards[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const _SwipeIndicator(),
        ],
      );
    }

    // 💻 DESKTOP
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1000;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDesktop ? 3 : 2,
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
  final String tag;
  final String title;
  final String description;
  final String imageLink;

  const _ProjectCard({
    required this.tag,
    required this.title,
    required this.description,
    required this.imageLink,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: hover
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.asset(
                widget.imageLink,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.tag,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
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
    );
  }
}

class _SwipeIndicator extends StatefulWidget {
  const _SwipeIndicator();

  @override
  State<_SwipeIndicator> createState() => _SwipeIndicatorState();
}

class _SwipeIndicatorState extends State<_SwipeIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _c,
      child: const Text(
        "← arraste para ver mais →",
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
