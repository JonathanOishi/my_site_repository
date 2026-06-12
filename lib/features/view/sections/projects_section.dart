import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:url_launcher/url_launcher.dart';

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
      style: TextStyle(
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
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = const [
      _ProjectCard(
        title: 'MyFinancy',
        description:
            'Aplicativo de controle financeiro pessoal desenvolvido em Android nativo. Permite gerenciar receitas e despesas, acompanhar saldo em tempo real e visualizar dados organizados. Projeto completo com foco em arquitetura limpa e persistência de dados.',
        imageLink: 'assets/my_financy.png',
        githubUrl: 'https://github.com/JonathanOishi/MyFinances',
        technologies: [
          'Kotlin',
          'MVVM',
          'Firebase Auth',
          'Firestore',
          'Retrofit',
          'REST API',
          'Material Design 3',
          'Clean Architecture',
        ],
      ),
      _ProjectCard(
        title: 'GeoTasks',
        description:
            'Aplicativo de produtividade desenvolvido em Flutter com foco em organização de tarefas inteligentes. Possui autenticação, sincronização em nuvem e recursos de geolocalização para tarefas baseadas em contexto.',
        imageLink: 'assets/geo_tasks.png',
        githubUrl: 'https://github.com/JonathanOishi/geo_tasks',
        technologies: [
          'Flutter',
          'Dart',
          'Provider',
          'MVVM',
          'Firebase Auth',
          'Firestore',
          'Geolocator',
          'REST API',
          'Image Picker',
        ],
      ),
      _ProjectCard(
        title: 'Web Site Portfólio',
        description:
            'Portfólio pessoal desenvolvido em Flutter Web para apresentação profissional. Estruturado com design system próprio, responsividade completa e foco em performance e experiência do usuário.',
        imageLink: 'assets/port_web.png',
        githubUrl: 'https://github.com/JonathanOishi/jonathanoishi.github.io',
        technologies: [
          'Flutter Web',
          'Dart',
          'Material 3',
          'Responsive Design',
          'Design System',
          'Animations',
          'GitHub Pages',
        ],
      ),
    ];

    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return SizedBox(
        height: 520, // Altura ampliada para dar espaço ao Wrap de tecnologias sem espremer o botão
        child: PageView.builder(
          controller: _pageController,
          itemCount: cards.length,
          physics: const BouncingScrollPhysics(),
          padEnds: false,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: cards[index],
            );
          },
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
        childAspectRatio: 0.58, // Proporção ajustada para evitar cortes de texto em telas desktop menores
      ),
      itemBuilder: (context, index) => cards[index],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageLink;
  final String githubUrl;
  final List<String> technologies;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.imageLink,
    required this.githubUrl,
    required this.technologies,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  Future<void> _openGithub() async {
    final uri = Uri.parse(widget.githubUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(46),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      maxLines: 4, // Permite ler mais do texto sem quebras bruscas
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(), // Mantém a estrutura rígida e limpa
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: widget.technologies.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: .12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16), // Garante um respiro elegante antes do botão
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _openGithub,
                        child: const Text("Ver no Github"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
