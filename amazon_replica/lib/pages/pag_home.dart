import 'package:flutter/material.dart';
import 'package:amazon_replica/components/amazon_app_bar.dart'; // Asegúrate de que apunte a tu componente
// Importa aquí tu página de producto si necesitas hacer el salto de pantalla:
// import 'package:amazon_app/pages/product_page.dart'; 

class PagHome extends StatelessWidget {
  const PagHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEDED), // Fondo gris claro de Amazon
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            AmazonAppBar(), 

            // ---- BANNER PRINCIPAL (Usando Stack como en tus apuntes) ----
            Stack(
              children: [
                // Imagen de fondo del Banner publicitario
                Image.asset(
                  'lib/images/amazon_banner.jpg', // Cambia por tu banner de fondo
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                // Texto encima del banner usando un contenedor transparente
                Container(
                  height: 300,
                  padding: const EdgeInsets.only(left: 40, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Envíos rápidos y miles de productos',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ---- FILA 1 DE PRODUCTOS (4 Columnas - Tarea 2) ----
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // Tarjeta 1 (Clicable con GestureDetector igual que tus apuntes)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Aquí pones el salto a la pantalla del producto si el profesor lo pide
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage()));
                      },
                      child: _buildProductCard('Ofertas del día', 'lib/images/product1.jpg', 'Ver más'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Tarjeta 2
                  Expanded(
                    child: _buildProductCard('Informática y Accesorios', 'lib/images/product2.jpg', 'Explorar ahora'),
                  ),
                  const SizedBox(width: 20),
                  // Tarjeta 3
                  Expanded(
                    child: _buildProductCard('Hogar y Cocina', 'lib/images/product3.jpg', 'Saber más'),
                  ),
                  const SizedBox(width: 20),
                  // Tarjeta 4
                  Expanded(
                    child: _buildProductCard('Regalos para Mamá', 'lib/images/product4.jpg', 'Comprar ya'),
                  ),
                ],
              ),
            ),

            // ---- SECCIÓN DE PRODUCTOS CIRCULARES (7 elementos en fila - Tarea 3) ----
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Descubre productos internacionales',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  // Lista horizontal usando SingleChildScrollView (para que no desborde la pantalla)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCircularItem('Moda', 'lib/images/circle1.jpg'),
                        _buildCircularItem('Deportes', 'lib/images/circle2.jpg'),
                        _buildCircularItem('Juguetes', 'lib/images/circle3.jpg'),
                        _buildCircularItem('Libros', 'lib/images/circle4.jpg'),
                        _buildCircularItem('Electrónica', 'lib/images/circle5.jpg'),
                        _buildCircularItem('Hogar', 'lib/images/circle6.jpg'),
                        _buildCircularItem('Belleza', 'lib/images/circle7.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget propio simplificado para hacer las tarjetas cuadradas (Basado en tus contenedores de San Francisco)
  Widget _buildProductCard(String title, String imagePath, String footerText) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4), // Bordes sutiles estilo web
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
          const SizedBox(height: 12),
          // Imagen del producto
          Center(
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            footerText,
            style: const TextStyle(color: Colors.teal, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // Widget propio para hacer los círculos de la Tarea 3
  Widget _buildCircularItem(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
              shape: BoxShape.circle,
            ),
            // ClipRRect sirve para que la imagen se adapte a la forma redonda del contenedor
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}