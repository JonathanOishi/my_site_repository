class HomeNavItem {
  const HomeNavItem({
    required this.id,
    required this.label,
    this.isPrimary = false,
  });

  final String id;
  final String label;
  final bool isPrimary;
}
