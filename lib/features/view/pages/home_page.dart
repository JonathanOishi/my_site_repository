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
    final key = _sectionKeys[id];
    final context = key?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onDrawerItemTap(String id) {
    Navigator.of(context).pop();
    _scrollToSection(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true, // Corrigido para true
      drawer: MobileNavDrawer(
        items: homeNavItems,
        onItemTap: _onDrawerItemTap,
      ),
      body: Column(
        children: [
          // Navbar fixo no topo, fora do scroll
          Navbar(
            items: homeNavItems,
            onItemTap: _scrollToSection,
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
          ),

          // O resto da página rola livremente
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                    child: ServicesSection(
                      onContactPressed: () =>
                          _scrollToSection(HomeSectionIds.contact),
                    ),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys[HomeSectionIds.contact],
                    child: const ContactSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys[HomeSectionIds.footer],
                    child: FooterSection(
                      onScrollToTop: () =>
                          _scrollToSection(HomeSectionIds.hero),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
