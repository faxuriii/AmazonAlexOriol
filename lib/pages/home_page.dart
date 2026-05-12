import 'package:flutter/material.dart';
import '../amazon_theme.dart';
import '../components/amazon_nav_bar.dart';
import '../components/product_card_widget.dart';
import '../components/circle_category_widget.dart';
import '../components/hero_banner_widget.dart';
import '../components/amazon_footer.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;

  const HomePage({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  // Data for the 8 main product containers (tasks 2 & 4)
  static const List<Map<String, String>> _mainCards = [
    {
      'title': 'Oferta Top',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/TopDeals_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': '',
    },
    {
      'title': 'Ofertas en Outlet',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/Outlet_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Explora ahora',
    },
    {
      'title': 'Hogar y cocina',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/HomeKitchen_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Saber más',
    },
    {
      'title': 'Informática y accesorios',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/PC_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Descubre más',
    },
    {
      'title': 'Regalos que le harán sonreír',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/GiftsForHer_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Comprar ahora',
    },
    {
      'title': 'Los libros más vendidos',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/Books_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Ver más',
    },
    {
      'title': 'La tienda del Día de la Madre',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/MothersDay_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Comprar ahora',
    },
    {
      'title': 'Ofertas para ti',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/OffersForYou_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Explora ahora',
    },
  ];

  // Data for circle section 1 - Descubre productos italianos
  static const List<Map<String, dynamic>> _italianItems = [
    {'label': 'Ideas de regalos', 'imageUrl': 'https://m.media-amazon.com/images/I/71XBiLXW3FL._AC_UL320_.jpg', 'bgColor': null},
    {'label': 'Juguetes', 'imageUrl': 'https://m.media-amazon.com/images/I/71JmojuLFIL._AC_UL320_.jpg', 'bgColor': null},
    {'label': 'Alimentación', 'imageUrl': 'https://m.media-amazon.com/images/I/81e9Wjr6nWL._AC_UL320_.jpg', 'bgColor': null},
    {'label': 'Ropa y accesorios', 'imageUrl': 'https://m.media-amazon.com/images/I/81n5N3JCaqL._AC_UL320_.jpg', 'bgColor': null},
    {'label': 'Hogar y muebles', 'imageUrl': 'https://m.media-amazon.com/images/I/71VcNVG9i7L._AC_UL320_.jpg', 'bgColor': null},
    {'label': 'Belleza y salud', 'imageUrl': 'https://m.media-amazon.com/images/I/71nNq5EY2nL._AC_UL320_.jpg', 'bgColor': null},
    {'label': 'Artesanía italiana', 'imageUrl': 'https://m.media-amazon.com/images/I/814Jnb9GZDL._AC_UL320_.jpg', 'bgColor': null},
  ];

  // Data for circle section 2 - La tienda del Día de la Madre
  static const List<Map<String, dynamic>> _mothersDayItems = [
    {'label': 'Regalos por menos de 25€', 'imageUrl': 'https://m.media-amazon.com/images/I/71EIxLlqhVL._AC_UL320_.jpg', 'bgColor': Color(0xFFFFCDD2)},
    {'label': 'Zapatos y ropa', 'imageUrl': 'https://m.media-amazon.com/images/I/71SuHFSFKpL._AC_UL320_.jpg', 'bgColor': Color(0xFFB3E5FC)},
    {'label': 'Accesorios de moda', 'imageUrl': 'https://m.media-amazon.com/images/I/71pFExE7YCL._AC_UL320_.jpg', 'bgColor': Color(0xFFF8BBD0)},
    {'label': 'Belleza y bienestar', 'imageUrl': 'https://m.media-amazon.com/images/I/71w9qGzRZ4L._AC_UL320_.jpg', 'bgColor': Color(0xFFFFF9C4)},
    {'label': 'Flores', 'imageUrl': 'https://m.media-amazon.com/images/I/71ysFOSGe3L._AC_UL320_.jpg', 'bgColor': Color(0xFFF8BBD0)},
    {'label': 'Personalizado y\nhecho a mano', 'imageUrl': 'https://m.media-amazon.com/images/I/81fUXgJsERL._AC_UL320_.jpg', 'bgColor': Color(0xFFE1F5FE)},
    {'label': 'Hogar y Jardín', 'imageUrl': 'https://m.media-amazon.com/images/I/71m2FhZLFaL._AC_UL320_.jpg', 'bgColor': Color(0xFFE8F5E9)},
  ];

  // Data for bottom 4 containers (task 4) reusing ProductCardWidget
  static const List<Map<String, String>> _bottomCards = [
    {
      'title': 'Hogar',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/Home_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Ver más',
    },
    {
      'title': 'Los favoritos de los influencers',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/Influencer_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Explora más',
    },
    {
      'title': 'Hallazgos de marcas top',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/TopBrands_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Explora más',
    },
    {
      'title': 'Electrónica',
      'imageUrl': 'https://images-na.ssl-images-amazon.com/images/G/30/kindle-cg/cg-main-page/es/2024/Electronics_ES_600x._SY400_QL70_FMpng_.png',
      'linkText': 'Ver más',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed nav bar
          AmazonNavBar(
            searchController: searchController,
            onSearch: onSearch,
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero banner
                  const HeroBannerWidget(),
                  // Task 2: 8 product cards in GridView (4x2)
                  Container(
                    color: AmazonColors.lightGray,
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _mainCards.length,
                      itemBuilder: (context, index) {
                        final card = _mainCards[index];
                        return ProductCardWidget(
                          title: card['title']!,
                          imageUrl: card['imageUrl']!,
                          linkText: card['linkText']!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Task 3: Circle category rows
                  CircleCategoryRow(
                    sectionTitle: 'Descubre productos italianos',
                    sectionLink: 'Descubre más',
                    items: _italianItems,
                  ),
                  const SizedBox(height: 8),
                  CircleCategoryRow(
                    sectionTitle: 'La tienda del Día de la Madre',
                    sectionLink: 'Compra ahora',
                    items: _mothersDayItems,
                  ),
                  const SizedBox(height: 8),
                  // Task 4: Bottom 4 containers reusing ProductCardWidget
                  Container(
                    color: AmazonColors.lightGray,
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _bottomCards.length,
                      itemBuilder: (context, index) {
                        final card = _bottomCards[index];
                        return ProductCardWidget(
                          title: card['title']!,
                          imageUrl: card['imageUrl']!,
                          linkText: card['linkText']!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Footer
                  const AmazonFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
