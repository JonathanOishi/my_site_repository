import 'package:jonathan_oishi_portfolio/features/view/navigation/home_nav_item.dart';

class HomeSectionIds {
  HomeSectionIds._();

  static const String hero = 'hero';
  static const String history = 'history';
  static const String stack = 'stack';
  static const String experience = 'experience';
  static const String education = 'education';
  static const String projects = 'projects';
  static const String service = 'service';
  static const String contact = 'contact';
  static const String footer = 'footer';
}

const List<HomeNavItem> homeNavItems = [
  HomeNavItem(id: HomeSectionIds.hero, label: 'Inicio'),
  HomeNavItem(id: HomeSectionIds.history, label: 'Sobre Mim'),
  HomeNavItem(id: HomeSectionIds.stack, label: 'Tecnologias'),
  HomeNavItem(id: HomeSectionIds.experience, label: 'Experiencia'),
  HomeNavItem(id: HomeSectionIds.education, label: 'Formacao'),
  HomeNavItem(id: HomeSectionIds.projects, label: 'Projetos'),
  HomeNavItem(id: HomeSectionIds.service, label: 'Service'),
  HomeNavItem(id: HomeSectionIds.contact, label: 'Contato', isPrimary: true),
];
