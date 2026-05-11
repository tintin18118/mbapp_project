import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../core/constants/app_colors.dart';
import '../data/models/cake_model.dart';
import '../screens/detail_screen.dart';

class CakeCard extends StatelessWidget {
  final Cake cake;
  const CakeCard({super.key, required this.cake});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (_) => DetailScreen(cake: cake)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: AppColors.chocolate.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: cake.imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, _) => Container(
                  height: 140,
                  color: AppColors.softPink,
                  child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                errorWidget: (_, _, _) => Container(
                  height: 140,
                  color: AppColors.softPink,
                  child: const Icon(Icons.cake, size: 40, color: AppColors.dustyRose),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cake.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14), maxLines: 2),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.caramel, size: 14),
                      const SizedBox(width: 2),
                      Text('${cake.rating}', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${cake.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppColors.chocolate,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}