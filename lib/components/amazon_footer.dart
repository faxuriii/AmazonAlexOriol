import 'package:flutter/material.dart';
import '../amazon_theme.dart';

class AmazonFooter extends StatelessWidget {
  const AmazonFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Recommendations CTA
        Container(
          color: AmazonColors.lightGray,
          padding: const EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                'Ver recomendaciones personalizadas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AmazonColors.black,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD814),
                  foregroundColor: AmazonColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                ),
                child: const Text('Identificarse'),
              ),
              const SizedBox(height: 8),
              const Text.rich(
                TextSpan(
                  text: '¿Eres un cliente nuevo? ',
                  style: TextStyle(fontSize: 12),
                  children: [
                    TextSpan(
                      text: 'Empieza aquí.',
                      style: TextStyle(color: AmazonColors.linkBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Back to top
        GestureDetector(
          onTap: () {},
          child: Container(
            color: const Color(0xFF37475A),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            child: const Text(
              'Volver arriba',
              style: TextStyle(color: AmazonColors.white, fontSize: 13),
            ),
          ),
        ),
        // Footer links
        Container(
          color: AmazonColors.footerDark,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _footerColumn('Conoce Amazon', [
                    'Trabaja con nosotros', 'Sobre Amazon', 'Inversores',
                    'Dispositivos Amazon', 'Amazon Science',
                  ]),
                  _footerColumn('Gana dinero con nosotros', [
                    'Vende en Amazon', 'Vende en Amazon Business',
                    'Vende tus apps en Amazon', 'Conviértete en afiliado',
                  ]),
                  _footerColumn('Pago con Amazon', [
                    'Recarga tu saldo', 'Amazon Currency Converter',
                    'Tarjeta de crédito Amazon', 'Tarjeta regalo',
                  ]),
                  _footerColumn('Ayuda', [
                    'Coronavirus y Amazon', 'Seguimiento de envíos',
                    'Devolver productos', 'Accesibilidad',
                    'Ayuda',
                  ]),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'amazon',
                style: TextStyle(
                  color: AmazonColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '© 1996-2025, Amazon.com, Inc. o sus afiliados',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _footerColumn(String title, List<String> items) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AmazonColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                item,
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
