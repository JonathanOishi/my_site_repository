import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/navigation/home_nav_items.dart';
import 'package:jonathan_oishi_portfolio/features/view/sections/hero_section.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/mobile_nav_drawer.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // O uso do GlobalKey continua útil para o scroll, mas o Drawer será aberto via Builder
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final Map<String, GlobalKey> _sectionKeys = {
    HomeSectionIds.hero: GlobalKey(),
    // ... adicione as outras chaves conforme seu projeto
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
    Navigator.of(context).pop(); // Fecha o drawer
    _scrollToSection(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: MobileNavDrawer(
        items: homeNavItems,
        onItemTap: _onDrawerItemTap,
      ),
      body: Column(
        children: [
          // Builder garante acesso ao contexto do Scaffold correto para abrir o drawer
          Builder(
            builder: (context) => Navbar(
              items: homeNavItems,
              onItemTap: _scrollToSection,
              onMenuTap: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _sectionKeys[HomeSectionIds.hero],
                    child: const HeroSection(),
                  ),
                  // Adicione suas outras seções aqui...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
