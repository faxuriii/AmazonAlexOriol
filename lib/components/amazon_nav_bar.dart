import 'package:flutter/material.dart';
import '../amazon_theme.dart';

class AmazonNavBar extends StatefulWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;

  const AmazonNavBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  State<AmazonNavBar> createState() => _AmazonNavBarState();
}

class _AmazonNavBarState extends State<AmazonNavBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTopBar(),
        _buildSecondaryBar(),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      color: AmazonColors.primaryDark,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          // Logo
          _buildLogo(),
          const SizedBox(width: 8),
          // Location
          _buildLocation(),
          const SizedBox(width: 8),
          // Search bar
          Expanded(child: _buildSearchBar()),
          const SizedBox(width: 8),
          // Language
          _buildLanguage(),
          const SizedBox(width: 8),
          // Account
          _buildAccount(),
          const SizedBox(width: 8),
          // Returns
          _buildReturns(),
          const SizedBox(width: 8),
          // Cart
          _buildCart(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 2),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'amazon',
            style: TextStyle(
              color: AmazonColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
              letterSpacing: -0.5,
            ),
          ),
          Text(
            '.es',
            style: TextStyle(
              color: AmazonColors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Entrega en Barcelona 08025',
          style: TextStyle(color: AmazonColors.white, fontSize: 9),
        ),
        Row(
          children: [
            const Icon(Icons.location_on, color: AmazonColors.white, size: 14),
            const Text(
              'Actualizar ubicación',
              style: TextStyle(
                color: AmazonColors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: AmazonColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Category dropdown
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE3E6E6),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: const Row(
              children: [
                Text('Todos los departamentos', style: TextStyle(fontSize: 11)),
                Icon(Icons.arrow_drop_down, size: 16),
              ],
            ),
          ),
          // Text field
          Expanded(
            child: TextField(
              controller: widget.searchController,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                hintText: 'Buscar en Amazon.es',
                hintStyle: TextStyle(fontSize: 13),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                isDense: true,
              ),
              onSubmitted: (_) => widget.onSearch(),
            ),
          ),
          // Search button
          GestureDetector(
            onTap: widget.onSearch,
            child: Container(
              width: 42,
              height: 38,
              decoration: const BoxDecoration(
                color: AmazonColors.primaryOrange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: const Icon(Icons.search, color: AmazonColors.black, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguage() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text('🇪🇸 ', style: TextStyle(fontSize: 14)),
            Text(
              'ES',
              style: TextStyle(color: AmazonColors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_drop_down, color: AmazonColors.white, size: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildAccount() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hola, identifícate',
          style: TextStyle(color: AmazonColors.white, fontSize: 11),
        ),
        Row(
          children: [
            Text(
              'Cuenta y listas',
              style: TextStyle(
                color: AmazonColors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AmazonColors.white, size: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildReturns() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Devoluciones',
          style: TextStyle(color: AmazonColors.white, fontSize: 11),
        ),
        Text(
          'y Pedidos',
          style: TextStyle(
            color: AmazonColors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCart() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_cart_outlined, color: AmazonColors.white, size: 32),
        Positioned(
          top: -4,
          left: 14,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: const Text(
              '0',
              style: TextStyle(
                color: AmazonColors.primaryOrange,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: -20,
          child: Text(
            'Cesta',
            style: TextStyle(
              color: AmazonColors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryBar() {
    return Container(
      color: AmazonColors.navBarBlue,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          _buildSecondaryItem(Icons.menu, 'Todo', bold: true),
          _buildSecondaryText('Supermercado'),
          _buildSecondaryText('Los más vendidos'),
          _buildSecondaryText('Amazon Basics'),
          _buildSecondaryText('Ofertas'),
          _buildSecondaryText('Música'),
          _buildSecondaryText('Últimas Novedades'),
          _buildSecondaryText('Prime'),
          _buildSecondaryText('Tarjetas regalo'),
          _buildSecondaryText('Informática'),
          const Spacer(),
          _buildSecondaryText('Regalos para mamá', bold: true),
        ],
      ),
    );
  }

  Widget _buildSecondaryItem(IconData icon, String label, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Icon(icon, color: AmazonColors.white, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: AmazonColors.white,
              fontSize: 13,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryText(String label, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        label,
        style: TextStyle(
          color: AmazonColors.white,
          fontSize: 13,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
