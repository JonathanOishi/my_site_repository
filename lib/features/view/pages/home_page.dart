import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/navigation/home_nav_items.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/contact_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/education_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/experience_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/footer_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/hero_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/my_history.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/projects_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/services_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/tech_stack_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/mobile_nav_drawer.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final Map<String, GlobalKey> _sectionKeys = {
    HomeSectionIds.hero: GlobalKey(),
    HomeSectionIds.history: GlobalKey(),
    HomeSectionIds.stack: GlobalKey(),
    HomeSectionIds.experience: GlobalKey(),
    HomeSectionIds.education: GlobalKey(),
    HomeSectionIds.projects: GlobalKey(),
    HomeSectionIds.service: GlobalKey(),
    HomeSectionIds.contact: GlobalKey(),
    HomeSectionIds.footer: GlobalKey(),
  };

  void _scrollToSection(String id) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _sectionKeys[id];
      final context = key?.currentContext;

      if (context != null) {
        Scrollable.ensureVisible(
          context,
          alignment: 0.0,
          duration: const Duration(
            milliseconds: 650,
          ),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _onDrawerItemTap(String id) {
    Navigator.of(context).pop();
    _scrollToSection(id);
  }

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.of(context).padding;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      drawer: MobileNavDrawer(
        items: homeNavItems,
        onItemTap: _onDrawerItemTap,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: systemPadding.top,
              color: AppColors.background,
            ),
            // Barra de navegação principal (Menu Superior)
            Navbar(
              items: homeNavItems,
              onItemTap: _scrollToSection,
              onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            // 1. Seção Principal (Apresentação / Hero)
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.hero],
              child: const HeroSection(),
            ),
            // 2. Sobre Mim / História
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.history],
              child: const MyHistory(),
            ),
            // 3. Tecnologias / Tech Stack Grid
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.stack],
              child: const TechGrid(),
            ),
            // 4. Experiência Profissional
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.experience],
              child: const ExperienceSection(),
            ),
            // 5. Educação / Formação Acadêmica
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.education],
              child: const EducationSection(),
            ),
            // 6. Projetos Desenvolvidos (MyFinancy, GeoTasks, etc.)
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.projects],
              child: const ProjectsSection(),
            ),
            // 7. Orçamentos e Serviços (Cards que direcionam para o contato)
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.service],
              child: ServicesSection(
                onContactPressed: () =>
                    _scrollToSection(HomeSectionIds.contact),
              ),
            ),
            // 8. Seção de Formulário / Informações de Contato
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.contact],
              child: const ContactSection(),
            ),
            // 9. Rodapé Técnico Melhorado (Com link para o topo e logo Flutter)
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.footer],
              child: FooterSection(
                onScrollToTop: () => _scrollToSection(HomeSectionIds.hero),
              ),
            ),
            Container(
              height: systemPadding.bottom,
              color: AppColors.background,
            ),
          ],
        ),
      ),
    );
  }
}
