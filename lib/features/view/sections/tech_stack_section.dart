import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class TechGrid extends StatelessWidget {
  const TechGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Desenvolvimento Mobile',
        'skills': [
          (Icons.flutter_dash, 'Flutter', 95),
          (Icons.code, 'Dart', 90),
          (Icons.storage, 'Firebase', 85),
          (Icons.phone_android, 'Flutter Web', 80),
        ],
      },
      {
        'title': 'Arquitetura & Padrões',
        'skills': [
          (Icons.architecture, 'MVVM', 90),
          (Icons.account_tree, 'Repository', 85),
          (Icons.rule, 'SOLID', 85),
          (Icons.layers, 'Clean Architecture', 80),
        ],
      },
      {
        'title': 'Networking & APIs',
        'skills': [
          (Icons.api, 'REST API', 90),
          (Icons.sync_alt, 'Dio', 85),
          (Icons.http, 'HTTP', 85),
          (Icons.data_object, 'JSON', 85),
        ],
      },
      {
        'title': 'Ferramentas',
        'skills': [
          (Icons.source, 'Git', 90),
          (Icons.hub, 'GitHub', 90),
          (Icons.code, 'VS Code', 95),
          (Icons.android, 'Android Studio', 85),
        ],
      },
      {
        'title': 'Backend & Banco',
        'skills': [
          (Icons.storage, 'Firestore', 85),
          (Icons.cloud, 'Firebase Auth', 85),
          (Icons.dns, 'SQLite', 75),
          (Icons.data_array_rounded, 'Realtime DB', 75),
        ],
      },
      {
        'title': 'Metodologias',
        'skills': [
          (Icons.groups, 'Scrum', 80),
          (Icons.view_kanban, 'Kanban', 80),
          (Icons.lightbulb, 'Design Thinking', 75),
          (Icons.auto_awesome, 'Design Sprint', 75),
        ],
      },
    ];

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1240,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 80,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.responsive(
                  context: context,
                  mobile: 1,
                  tablet: 2,
                  desktop: 3,
                ),
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: Responsive.responsive(
                  context: context,
                  mobile: 1.35,
                  tablet: 1.15,
                  desktop: 1.15,
                ),
              ),
              itemBuilder: (_, index) {
                final category = categories[index];

                return Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceAlt,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category['title'] as String,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...(category['skills'] as List).map(
                              (skill) => _SkillItem(
                                icon: skill.$1 as IconData,
                                name: skill.$2 as String,
                                percentage: skill.$3 as int,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({
    required this.icon,
    required this.name,
    required this.percentage,
  });

  final IconData icon;
  final String name;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        minHeight: 6,
                        backgroundColor: AppColors.border,
                        valueColor: const AlwaysStoppedAnimation(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  SizedBox(
                    width: 36,
                    child: Text(
                      '$percentage%',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
