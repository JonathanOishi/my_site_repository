import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/app_spacing.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            child: Responsive.responsive<Widget>(
              context: context,
              mobile: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ContactFormCard(),
                  SizedBox(height: AppSpacing.xl),
                  _ContactInfoCard(),
                ],
              ),
              tablet: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 9, child: _ContactFormCard()),
                  SizedBox(width: AppSpacing.xl),
                  Expanded(flex: 8, child: _ContactInfoCard()),
                ],
              ),
              desktop: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 9, child: _ContactFormCard()),
                  SizedBox(width: AppSpacing.xl),
                  Expanded(flex: 8, child: _ContactInfoCard()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactFormCard extends StatelessWidget {
  const _ContactFormCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vamos construir algo incrivel?',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _FieldLabel('SEU NOME'),
          const _InputPlaceholder('Jonathan Oishi'),
          const SizedBox(height: AppSpacing.md),
          const _FieldLabel('EMAIL'),
          const _InputPlaceholder('email@exemplo.com'),
          const SizedBox(height: AppSpacing.md),
          const _FieldLabel('MENSAGEM'),
          const _InputPlaceholder('Descreva seu projeto ou proposta...'),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textPrimary,
                minimumSize: const Size(0, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Enviar Mensagem'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  const _ContactInfoCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informacoes de Contato',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Responsive.responsive<Widget>(
          context: context,
          mobile: const Column(
            children: [
              _InfoChip(
                icon: Icons.alternate_email,
                title: 'EMAIL',
                value: 'jonathan.oishi@dev.com',
              ),
              SizedBox(height: AppSpacing.md),
              _InfoChip(
                icon: Icons.location_on_outlined,
                title: 'LOCALIDADE',
                value: 'Pernambuco/BR',
              ),
            ],
          ),
          tablet: const Row(
            children: [
              Expanded(
                child: _InfoChip(
                  icon: Icons.alternate_email,
                  title: 'EMAIL',
                  value: 'jonathan.oishi@dev.com',
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: _InfoChip(
                  icon: Icons.location_on_outlined,
                  title: 'LOCALIDADE',
                  value: 'Pernambuco/BR',
                ),
              ),
            ],
          ),
          desktop: const Row(
            children: [
              Expanded(
                child: _InfoChip(
                  icon: Icons.alternate_email,
                  title: 'EMAIL',
                  value: 'jonathan.oishi@dev.com',
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: _InfoChip(
                  icon: Icons.location_on_outlined,
                  title: 'LOCALIDADE',
                  value: 'Pernambuco/BR',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.primary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Curriculo Completo',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              const Text(
                'Perfil atualizado em PDF.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textPrimary,
                  minimumSize: const Size(double.infinity, 44),
                ),
                icon: const Icon(Icons.download_rounded),
                label: const Text('Baixar Curriculo PDF'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 18),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(
        value,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _InputPlaceholder extends StatelessWidget {
  const _InputPlaceholder(this.hint);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.input,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        hint,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),
      ),
    );
  }
}
