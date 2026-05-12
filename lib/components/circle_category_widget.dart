import 'package:flutter/material.dart';
import '../amazon_theme.dart';

class CircleCategoryWidget extends StatelessWidget {
  final String label;
  final String imageUrl;
  final Color? backgroundColor;

  const CircleCategoryWidget({
    super.key,
    required this.label,
    required this.imageUrl,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: backgroundColor ?? AmazonColors.lightGray,
          backgroundImage: NetworkImage(imageUrl),
          onBackgroundImageError: (_, __) {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ?? AmazonColors.lightGray,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AmazonColors.black,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class CircleCategoryRow extends StatelessWidget {
  final String sectionTitle;
  final String? sectionLink;
  final List<Map<String, dynamic>> items;

  const CircleCategoryRow({
    super.key,
    required this.sectionTitle,
    this.sectionLink,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AmazonColors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                sectionTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AmazonColors.black,
                ),
              ),
              if (sectionLink != null) ...[
                const SizedBox(width: 12),
                Text(
                  sectionLink!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AmazonColors.linkBlue,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CircleCategoryWidget(
                label: items[index]['label'] as String,
                imageUrl: items[index]['imageUrl'] as String,
                backgroundColor: items[index]['bgColor'] as Color?,
              );
            },
          ),
        ],
      ),
    );
  }
}
