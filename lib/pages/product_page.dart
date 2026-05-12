import 'package:flutter/material.dart';
import '../amazon_theme.dart';
import '../components/amazon_nav_bar.dart';

// --- Sub-widgets encapsulated as required ---

class ProductBreadcrumb extends StatelessWidget {
  const ProductBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: const [
          Text('Informática', style: TextStyle(color: AmazonColors.linkBlue, fontSize: 12)),
          Text(' › ', style: TextStyle(fontSize: 12)),
          Text('Portátiles', style: TextStyle(color: AmazonColors.linkBlue, fontSize: 12)),
          Text(' › ', style: TextStyle(fontSize: 12)),
          Text('Portátiles tradicionales', style: TextStyle(color: AmazonColors.linkBlue, fontSize: 12)),
        ],
      ),
    );
  }
}

class ProductImageGallery extends StatefulWidget {
  const ProductImageGallery({super.key});

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  int _selectedIndex = 0;

  final List<String> _thumbnailUrls = [
    'https://m.media-amazon.com/images/I/71mI5MYPiPL._AC_SX300_SY300_.jpg',
    'https://m.media-amazon.com/images/I/71kPPD7F4kL._AC_SX300_SY300_.jpg',
    'https://m.media-amazon.com/images/I/71jRXyWg3iL._AC_SX300_SY300_.jpg',
    'https://m.media-amazon.com/images/I/71mHnBD2vOL._AC_SX300_SY300_.jpg',
    'https://m.media-amazon.com/images/I/71J2O6bGRUL._AC_SX300_SY300_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Thumbnails column
        SizedBox(
          width: 60,
          child: Column(
            children: List.generate(_thumbnailUrls.length, (i) {
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = i),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedIndex == i
                          ? AmazonColors.primaryOrange
                          : AmazonColors.borderGray,
                      width: _selectedIndex == i ? 2 : 1,
                    ),
                  ),
                  child: Image.network(
                    _thumbnailUrls[i],
                    width: 54,
                    height: 54,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Container(
                      width: 54,
                      height: 54,
                      color: AmazonColors.lightGray,
                      child: const Icon(Icons.image, size: 20),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 12),
        // Main image
        Expanded(
          child: Image.network(
            _thumbnailUrls[_selectedIndex],
            height: 380,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Container(
              height: 380,
              color: AmazonColors.lightGray,
              child: const Icon(Icons.laptop, size: 80, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        const Text(
          'Ordenador Portatil con I-ntel N97 (hasta 3,6 GHz), Portátil Computadora 16GB DDR4 512GB SSD Expansión 2TB (Mejor que Celeron) Laptop,WiFi,BT5,Tipo C,USB3.2, HDMI, 15,6" Notebook 1080P Versión 2025',
          style: TextStyle(fontSize: 18, color: AmazonColors.black),
        ),
        const SizedBox(height: 8),
        // Rating
        Row(
          children: [
            const Text('Visita la tienda de AOC',
                style: TextStyle(color: AmazonColors.linkBlue, fontSize: 13)),
            const SizedBox(width: 16),
            _buildStars(4.2),
            const SizedBox(width: 8),
            const Text('231 valoraciones',
                style: TextStyle(color: AmazonColors.linkBlue, fontSize: 13)),
          ],
        ),
        const SizedBox(height: 4),
        const Text('100+ comprados el mes pasado',
            style: TextStyle(color: AmazonColors.textGray, fontSize: 12)),
        const Divider(height: 20),
        // Price
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: const [
            Text('-14 % ', style: TextStyle(color: AmazonColors.red, fontSize: 16)),
            Text(
              '395',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AmazonColors.black),
            ),
            Text(
              '99 €',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AmazonColors.black),
            ),
          ],
        ),
        const Text(
          'Precio recomendado: 460,09€',
          style: TextStyle(color: AmazonColors.textGray, fontSize: 12),
        ),
        const SizedBox(height: 8),
        const Text(
          'Devoluciones GRATIS',
          style: TextStyle(color: AmazonColors.linkBlue, fontSize: 13),
        ),
        const SizedBox(height: 8),
        const Text(
          'Los precios de los productos vendidos en Amazon incluyen el IVA. Dependiendo de tu dirección de entrega, el IVA puede variar al finalizar la compra.',
          style: TextStyle(color: AmazonColors.textGray, fontSize: 12),
        ),
        const Divider(height: 20),
        // Screen size selector
        const Text('Tamaño: 15,6 Pulgadas',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildSizeOption('15,6\nPulgadas', '395,99€', true),
            const SizedBox(width: 8),
            _buildSizeOption('16 Pulgadas', 'Ver opciones\ndisponibles', false),
            const SizedBox(width: 8),
            _buildSizeOption('16,10\nPulgadas', 'Ver opciones\ndisponibles', false),
          ],
        ),
        const SizedBox(height: 12),
        // Color
        const Text('Color: Gris Oscuro',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildColorOption('https://m.media-amazon.com/images/I/31X5JGOlMLL._AC_US40_.jpg', true),
            const SizedBox(width: 8),
            _buildColorOption('https://m.media-amazon.com/images/I/31iQTSHBqbL._AC_US40_.jpg', false),
          ],
        ),
        const Divider(height: 20),
        // Specs table
        _buildSpecsTable(),
      ],
    );
  }

  Widget _buildStars(double rating) {
    return Row(
      children: List.generate(5, (i) {
        if (i < rating.floor()) {
          return const Icon(Icons.star, color: AmazonColors.yellow, size: 16);
        } else if (i < rating) {
          return const Icon(Icons.star_half, color: AmazonColors.yellow, size: 16);
        }
        return const Icon(Icons.star_border, color: AmazonColors.yellow, size: 16);
      }),
    );
  }

  Widget _buildSizeOption(String size, String price, bool selected) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? AmazonColors.primaryOrange : AmazonColors.borderGray,
          width: selected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(size,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.center),
          Text(price,
              style: const TextStyle(color: AmazonColors.linkBlue, fontSize: 11),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildColorOption(String url, bool selected) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? AmazonColors.primaryOrange : AmazonColors.borderGray,
          width: selected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Image.network(url, width: 40, height: 40, fit: BoxFit.contain,
          errorBuilder: (_, __, ___) =>
              Container(width: 40, height: 40, color: Colors.grey)),
    );
  }

  Widget _buildSpecsTable() {
    const specs = [
      ['Marca', 'AOC'],
      ['Nombre del modelo', '2025 AOC portátil'],
      ['Tamaño de pantalla', '15,6 Pulgadas'],
      ['Color', 'Gris Oscuro'],
      ['Tamaño del disco duro', '512 GB'],
    ];
    return Table(
      columnWidths: const {0: FixedColumnWidth(150), 1: FlexColumnWidth()},
      children: specs
          .map((row) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(row[0],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(row[1], style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ))
          .toList(),
    );
  }
}

class ProductBuyBox extends StatelessWidget {
  const ProductBuyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AmazonColors.borderGray),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Prime shipping
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF002D62),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '⚡ Envío rápido y gratis',
                  style: TextStyle(color: AmazonColors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(height: 4),
                Text(
                  'Te ofrecemos una prueba GRATIS de 30 días de Prime.',
                  style: TextStyle(color: AmazonColors.white, fontSize: 11),
                ),
                SizedBox(height: 4),
                Text(
                  'prime',
                  style: TextStyle(
                    color: Color(0xFF00A8E0),
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text('395',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Text('99 €', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Devoluciones GRATIS',
              style: TextStyle(color: AmazonColors.linkBlue, fontSize: 12)),
          const SizedBox(height: 4),
          const Text.rich(
            TextSpan(
              text: 'Entrega GRATIS ',
              style: TextStyle(fontSize: 12),
              children: [
                TextSpan(
                  text: 'el viernes, 2 de mayo.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' Haz el pedido en '),
                TextSpan(
                  text: '3 horas.',
                  style: TextStyle(color: AmazonColors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '📍 Entrega en Barcelona 08025 - Actualizar ubicación',
            style: TextStyle(color: AmazonColors.linkBlue, fontSize: 12),
          ),
          const Divider(height: 16),
          const Text(
            'En stock',
            style: TextStyle(color: AmazonColors.green, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          // Quantity
          Row(
            children: [
              const Text('Cantidad: ', style: TextStyle(fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AmazonColors.borderGray),
                  borderRadius: BorderRadius.circular(4),
                  color: AmazonColors.lightGray,
                ),
                child: const Row(
                  children: [
                    Text('1', style: TextStyle(fontSize: 13)),
                    Icon(Icons.arrow_drop_down, size: 18),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Add to cart
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD814),
                foregroundColor: AmazonColors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text('Añadir a la cesta',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 8),
          // Buy now
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA41C),
                foregroundColor: AmazonColors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text('Comprar ya',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const Divider(height: 16),
          // Seller info
          _buildInfoRow('Envío desde', 'Amazon'),
          _buildInfoRow('Vendido por', 'BOBD0117'),
          _buildInfoRow('Devoluciones',
              'Se puede devolver en un plazo de 30 días a partir de la...'),
          _buildInfoRow('Pago', 'Transacción segura'),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: const Text('Añadir a la Lista de deseos',
                  style: TextStyle(fontSize: 12)),
            ),
          ),
          const Divider(height: 16),
          const Text(
            'Otros vendedores en Amazon',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const Text(
            'Nuevos (5) desde 395⁹⁹€  Envío',
            style: TextStyle(color: AmazonColors.linkBlue, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(label, style: const TextStyle(fontSize: 12, color: AmazonColors.textGray)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

// --- Main product page ---

class ProductPage extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;

  const ProductPage({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Nav bar (task 5 - same nav)
          AmazonNavBar(
            searchController: searchController,
            onSearch: onSearch,
          ),
          // Secondary category nav specific to product page
          Container(
            color: AmazonColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  'Informática', 'Portátiles', 'Tablets', 'Oficina',
                  'Monitores', 'Componentes', 'Gaming', 'Almacenamiento',
                  'Accesorios', 'Dispositivos de red', 'Impresora y tinta',
                  'Amazon Business'
                ]
                    .map((label) => Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(label,
                              style: const TextStyle(
                                  color: AmazonColors.linkBlue, fontSize: 13)),
                        ))
                    .toList(),
              ),
            ),
          ),
          // Scrollable product content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductBreadcrumb(),
                  // Main section: Row with 4 elements
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // 1: Image gallery
                        SizedBox(
                          width: 350,
                          child: ProductImageGallery(),
                        ),
                        SizedBox(width: 24),
                        // 2: Product info (center)
                        Expanded(child: ProductInfo()),
                        SizedBox(width: 24),
                        // 3: Buy box
                        SizedBox(
                          width: 260,
                          child: ProductBuyBox(),
                        ),
                      ],
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
