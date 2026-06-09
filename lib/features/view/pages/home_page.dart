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
    HomeSectionIds.contact: GlobalKey(),
    HomeSectionIds.footer: GlobalKey(),
    HomeSectionIds.service: GlobalKey(),
  };

  void _scrollToSection(String id) {
    final key = _sectionKeys[id];
    final context = key?.currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      alignment: 0,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  void _onDrawerItemTap(String id) {
    Navigator.of(context).pop();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSection(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pegamos os paddings de segurança do dispositivo atual
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
            // 1. ESPAÇAMENTO DO TOPO: Cria uma barreira segura da cor do fundo do app para empurrar a Navbar para baixo do relógio do iPhone
            Container(
              height: systemPadding.top,
              color: AppColors
                  .background, // Usa a mesma cor da Navbar/Fundo para ficar invisível
            ),

            Navbar(
              items: homeNavItems,
              onItemTap: _scrollToSection,
              onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.hero],
              child: const HeroSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.history],
              child: const MyHistory(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.stack],
              child: const TechGrid(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.experience],
              child: const ExperienceSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.education],
              child: const EducationSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.projects],
              child: const ProjectsSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.service],
              child: const ServicesSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.contact],
              child: const ContactSection(),
            ),
            KeyedSubtree(
              key: _sectionKeys[HomeSectionIds.footer],
              child: const FooterSection(),
            ),

            // 2. ESPAÇAMENTO DO RODAPÉ: Se o celular tiver aquela barra inferior de fechar apps, cria um bloco protetor embaixo do Footer
            Container(
              height: systemPadding.bottom,
              color: AppColors
                  .background, // Cor idêntica ao fundo do seu FooterSection
            ),
          ],
        ),
      ),
    );
  }
}
