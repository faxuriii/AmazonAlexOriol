import 'package:flutter/material.dart';
import '../amazon_theme.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String linkText;
  final Color? backgroundColor;

  const ProductCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.linkText,
    this.backgroundColor = AmazonColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AmazonColors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (_, __, ___) => Container(
                color: AmazonColors.lightGray,
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            linkText,
            style: const TextStyle(
              color: AmazonColors.linkBlue,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
