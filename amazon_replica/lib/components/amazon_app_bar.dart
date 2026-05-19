import 'package:flutter/material.dart';

class AmazonAppBar extends StatelessWidget {
  const AmazonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF131921);
    const Color secondaryBlue = Color(0xFF232F3E);
    const Color amazonOrange = Color(0xFFFEBD69);

    return Container(
      color: primaryBlue,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Text(
                  'amazon.es',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.white, size: 18),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enviar a', style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                        const Text('España', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 30),

                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Text(
                            'Buscar en Amazon.es',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: amazonOrange,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          child: const Icon(Icons.search, color: primaryBlue),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hola, identifícate', style: TextStyle(color: Colors.white, fontSize: 11)),
                        Text('Cuenta y listas', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Devoluciones', style: TextStyle(color: Colors.white, fontSize: 11)),
                        Text('& Pedidos', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(width: 20),
                    
                    Row(
                      children: const [
                        Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 28),
                        SizedBox(width: 4),
                        Text('Cesta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            color: secondaryBlue,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                const Icon(Icons.menu, color: Colors.white),
                const SizedBox(width: 5),
                const Text('Todo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(width: 20),
                const Text('Ofertas', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 20),
                const Text('Servicio al Cliente', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 20),
                const Text('Listas de Regalos', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 20),
                const Text('Vender', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}