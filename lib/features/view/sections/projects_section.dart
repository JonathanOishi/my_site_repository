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

    final link = const Text(
      'Projetos',
      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
    );

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [title, const SizedBox(height: 6), link],
          )
        : Row(
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
        title: 'MyFinancy',
        description: '...',
        imageLink: 'assets/my_financy.png',
        technologies: ['Kotlin', 'MVVM', 'Firebase'],
      ),
      _ProjectCard(
        title: 'GeoTasks',
        description: '...',
        imageLink: 'assets/geo_tasks.png',
        technologies: ['Flutter', 'Dart', 'Provider'],
      ),
      _ProjectCard(
        title: 'Web Site Portifolio',
        description: '...',
        imageLink: 'assets/port_web.png',
        technologies: ['Flutter', 'Dart', 'Design System'],
      ),
    ];

    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          SizedBox(
            height: 480, // Altura fixa para evitar conflito de hit-test
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: cards.length,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(right: 16),
                child: cards[index],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const _SwipeIndicator(),
        ],
      );
    }

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
            childAspectRatio: isDesktop ? 0.70 : 0.64,
          ),
          itemBuilder: (context, index) => cards[index],
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title, description, imageLink;
  final List<String> technologies;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.imageLink,
    required this.technologies,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    // Definimos o card como um widget que garante que os cliques sejam capturados
    final cardContent = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        // Sombra condicional para evitar processamento desnecessário no mobile
        boxShadow: !isMobile && hover
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.asset(widget.imageLink, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tech Wrap...
                  const Spacer(),
                  // --- CORREÇÃO DE BOTÕES ---
                  Row(
                    children: [
                      _buildButton(context, "Preview", () {}),
                      const SizedBox(width: 10),
                      _buildButton(context, "Código", () {}, isOutlined: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    // Se for mobile, retornamos o card puro (sem MouseRegion que causa conflito)
    if (isMobile) return cardContent;

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: cardContent,
    );
  }

  // Método auxiliar que garante a área de toque (HitTest) correta
  Widget _buildButton(
    BuildContext context,
    String label,
    VoidCallback onPressed, {
    bool isOutlined = false,
  }) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: Material(
          color: Colors.transparent,
          // O InkWell é o padrão correto para botões que precisam de feedback de toque
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onPressed,
            child: isOutlined
                ? OutlinedButton(onPressed: null, child: Text(label))
                : ElevatedButton(onPressed: null, child: Text(label)),
          ),
        ),
      ),
    );
  }
}

class _SwipeIndicator extends StatelessWidget {
  const _SwipeIndicator();
  @override
  Widget build(BuildContext context) => const Text(
    "← arraste para ver mais →",
    style: TextStyle(fontSize: 12, color: Colors.grey),
  );
}
