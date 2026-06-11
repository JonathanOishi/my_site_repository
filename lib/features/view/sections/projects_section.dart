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
      'Projetos',
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

class _ProjectsGrid extends StatelessWidget {
  const _ProjectsGrid();

  @override
  Widget build(BuildContext context) {
    final cards = const [
      _ProjectCard(
        title: 'MyFinancy',
        description:
            'Aplicativo de controle financeiro pessoal que permite gerenciar receitas, despesas e acompanhar o saldo de forma simples e organizada, com autenticação de usuários e sincronização em nuvem.',
        imageLink: 'assets/my_financy.png',
        technologies: [
          'Kotlin',
          'MVVM',
          'Firebase',
          'Retrofit',
          'REST API',
          'FCM',
          'AdMob',
          'Material 3', // Se houver mais de 8, o .take(8) vai cortar automaticamente
        ],
      ),
      _ProjectCard(
        title: 'GeoTasks',
        description:
            'Aplicativo de gerenciamento de tarefas desenvolvido em Flutter, permitindo criar, editar, concluir e organizar tarefas com sincronização em tempo real, autenticação de usuários e integração com geolocalização.',
        imageLink: 'assets/geo_tasks.png',
        technologies: [
          'Flutter',
          'Dart',
          'Provider',
          'MVVM',
          'Firebase Auth',
          'Firestore',
          'Geolocator',
          'Image Picker',
          'Slidable',
          'Dotenv',
        ],
      ),
      _ProjectCard(
        title: 'Web Site Portifolio',
        description:
            'Portfólio profissional desenvolvido em Flutter Web para apresentar minha trajetória, formação acadêmica, experiência profissional, stack tecnológica e projetos desenvolvidos. A aplicação possui layout responsivo para desktop, tablet e mobile, navegação fluida entre seções e arquitetura organizada para facilitar manutenção e evolução contínua.',
        imageLink: 'assets/port_web.png',
        technologies: [
          'Flutter',
          'Dart',
          'Material Design 3',
          'Responsive',
          'Componentização',
          'Animation',
          'Design System',
          'GitHub Pages',
        ],
      ),
    ];

    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return Column(
        children: [
          IntrinsicHeight(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: cards.map((card) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                    child: card,
                  );
                }).toList(),
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
            // Proporção perfeita para manter os botões alinhados na mesma linha horizontal na Web
            childAspectRatio: isDesktop ? 0.70 : 0.64,
          ),
          itemBuilder: (context, index) => cards[index],
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageLink;
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
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Imagem do Projeto
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

            // 2. Bloco de Conteúdo Expandido (Garante o alinhamento dos botões embaixo)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TÍTULO
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // DESCRIÇÃO
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

                    // CHIPS DE TECNOLOGIAS (Limitado estritamente a 8 itens e 2 linhas de quebra)
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.technologies.take(8).map((tech) {
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

                    // O Spacer empurra os botões para o final, alinhando-os horizontalmente em todos os cards
                    const Spacer(),
                    const SizedBox(height: 12),

                    // BOTÕES DE AÇÃO (Alinhamento horizontal perfeito)
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Preview"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Código"),
                            ),
                          ),
                        ),
                      ],
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
