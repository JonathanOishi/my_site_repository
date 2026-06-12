import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  static Future<void> sendMessage({
    required String nome,
    required String email,
    required String mensagem,
  }) async {
    final texto =
        '''
Olá Jonathan! 👋

Tenho interesse em um orçamento.

👤 Nome: $nome
📧 Email: $email

📝 Detalhes do projeto:
$mensagem
''';

    final uri = Uri.parse(
      'https://wa.me/5511951402161?text=${Uri.encodeComponent(texto)}',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
